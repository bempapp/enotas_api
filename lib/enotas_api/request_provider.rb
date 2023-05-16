# frozen_string_literal: true

require 'net/http'

module EnotasApi
  class RequestProvider
    def get(url)
      request(obj: Net::HTTP::Get, url:)
    end

    def post(url, body)
      request(obj: Net::HTTP::Post, url:, body:)
    end

    def post_form(url, form_data)
      request(obj: Net::HTTP::Post, url:, form_data: form_data.to_a)
    end

    def delete(url)
      request(obj: Net::HTTP::Delete, url:)
    end

    private

    def request(obj:, url:, body: nil, form_data: nil, headers: {})
      uri = URI(url)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if url.start_with?('https')

      request = obj.new(uri)
      configure_request_headers(request, headers)

      request.body = body if body
      request.set_form(form_data, 'multipart/form-data') if form_data

      track_request_time(request) do
        response = http.request(request)

        [response.code.to_i, response.body]
      end
    end

    def configure_request_headers(request, custom_headers)
      {
        'Authorization' => "Basic #{EnotasApi::Configuration.current.api_key}",
        Accept: 'application/json',
        'Content-Type' => 'application/json',
        'User-Agent' => 'Enotas-Ruby-SDK'
      }.merge(custom_headers).each { |key, value| request[key] = value }
    end

    def track_request_time(request)
      start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      value = yield
      finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)

      info = "#{request.method} #{request.path}"
      time = "#{(finish - start).round(2)} seconds"
      EnotasApi::Configuration.current.logger.info("[RequestProvider] #{info} done in #{time}")
      value
    end
  end
end
