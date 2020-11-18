# frozen_string_literal: true

require 'net/http'

module EnotasApi
  class RequestProvider
    def get(url)
      request(obj: Net::HTTP::Get, url: url)
    end

    def post(url, body)
      request(obj: Net::HTTP::Post, url: url, body: body)
    end

    def post_form(url, form_data)
      request(obj: Net::HTTP::Post, url: url, form_data: form_data.to_a)
    end

    private

    def request(obj:, url:, body: nil, form_data: nil, headers: {})
      track_request_time(url) do
        uri = URI(url)

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true if url.start_with?('https')

        request = obj.new(uri)
        configure_request_headers(request, headers)

        request.body = body if body
        request.set_form(form_data, 'multipart/form-data') if form_data

        response = http.request(request)

        [response.code.to_i, response.body]
      end
    end

    def configure_request_headers(request, custom_headers)
      {
        'Authorization' => "Basic #{EnotasApi::Configuration.current.api_key}",
        "Accept": 'application/json',
        'Content-Type' => 'application/json',
        'User-Agent' => 'Enotas-Ruby-SDK'
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
