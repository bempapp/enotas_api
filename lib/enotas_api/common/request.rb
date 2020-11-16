# frozen_string_literal: true

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

    attr_reader :params

    def initialize
      @params = {}
      page if respond_to?(:page)
      super
    end

    def call
      code, content = case method
                      when :GET then configuration.request_provider.get(to_url)
                      when :POST then configuration.request_provider.post(to_url, to_json)
                      else raise "Invalid method #{@method}"
                      end

      result_object.new(code, content)
    end

    def call!
      result = call
      raise "[Request][ERROR] Status:#{result.status_code}\n#{result.to_json}" if result.error?

      result
    end

    def method
      :GET
    end

    def entity; end

    def result_object
      EnotasApi::Result
    end

    def uri; end

    def to_url
      url = "#{configuration.base_url}#{uri}"

      query_params = encode_query_params(@params) if @params
      url += "?#{query_params}" unless query_params&.empty?

      url
    end

    def to_json(*_args)
      @entity&.to_json
    end

    def param(name, value)
      @params[name] = value
      self
    end

    private

    def configuration
      EnotasApi::Configuration.current
    end
  end
end
