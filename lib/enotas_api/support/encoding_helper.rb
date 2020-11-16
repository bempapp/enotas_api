# frozen_string_literal: true

require 'erb'
require 'CGI'

module EnotasApi
  module EncodingHelper
    def url_encode(value)
      ERB::Util.url_encode(value)
    end

    def query_encode(value)
      CGI.escape(value)
    end

    def encode_query_params(params)
      URI.encode_www_form(params.compact { |_k, v| v.nil? })
    end
  end
end
