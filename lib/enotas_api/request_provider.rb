# frozen_string_literal: true

require 'net/http'

module EnotasApi
  class RequestProvider
    def get(url, headers = {})
      request(Net::HTTP::Get, url, nil, headers)
    end

    def post(url, body, headers = {})
      request(Net::HTTP::Post, url, body, headers)
    end

    private

    def request(request_obj, url, body, headers)
      track_request_time(url) do
        uri = URI(url)

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true if url.start_with?('https')

        request = request_obj.new(uri)
        configure_request_headers(request, headers)

        request.body = body if body
        response = http.request(request)

        [response.code.to_i, response.body]
      end
    end

    def configure_request_headers(request, custom_headers)
      {
        'Authorization' => "Basic #{EnotasApi::Configuration.current.api_key}",
        'Content-Type' => 'application/json',
        'User-Agent' => 'Enotas-Ruby-SDK',
        "Accept": 'application/json'
      }.merge(custom_headers).each { |key, value| request[key] = value }
    end

    def track_request_time(url)
      start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      value = yield
      finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      EnotasApi::Configuration.current.logger.info("[RequestProvider] #{url} done in #{(finish - start).round(2)} seconds")
      value
    end
  end
end
