# frozen_string_literal: true

require 'json'
require_relative 'json_result'
require_relative '../support/encoding_helper'
require_relative '../support/filterable'
require_relative '../support/paginable'
require_relative '../support/searchable'
require_relative '../support/sortable'

module EnotasApi
  class Request
    include EnotasApi::EncodingHelper
    include EnotasApi::Filterable
    include EnotasApi::Paginable
    include EnotasApi::Searchable
    include EnotasApi::Sortable

    attr_reader :params, :uri, :content, :method, :result_object

    def initialize(uri:, method: :GET, content: nil, result_object: EnotasApi::JsonResult)
      @method = method
      @uri = uri
      @content = content
      @result_object = result_object
      @params = {}
      page if respond_to?(:page)
      super()
    end

    def call
      code, content = make_request

      result_object.new(code, content)
    end

    def call!
      result = call
      raise EnotasApi::Error, "[Request][ERROR] Status:#{result.status_code}\n#{result.to_json}" if result.error?

      result
    end

    def to_url
      url = "#{base_url}#{uri}"

      query_params = encode_query_params(params) if params
      url += "?#{query_params}" unless query_params&.empty?

      url
    end

    def to_json(options = nil)
      return nil if content.nil?

      content.is_a?(String) ? content : content.to_json(options)
    end

    def param(name, value)
      @params[name] = value
      self
    end

    private

    def make_request
      case method
      when :GET then request_provider.get(to_url)
      when :POST then request_provider.post(to_url, content)
      when :POST_FORM then request_provider.post_form(to_url, content)
      when :DELETE then request_provider.delete(to_url)
      else raise EnotasApi::Error, "Invalid http method '#{method}'"
      end
    end

    def base_url
      EnotasApi::Configuration.current.base_url
    end

    def request_provider
      EnotasApi::Configuration.current.request_provider
    end
  end
end
