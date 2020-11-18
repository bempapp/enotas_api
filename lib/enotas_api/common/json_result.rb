# frozen_string_literal: true

require 'json'
require_relative 'raw_result'

module EnotasApi
  class JsonResult < EnotasApi::RawResult
    def initialize(status_code, json)
      @data = json.nil? || json.empty? ? {} : JSON.parse(json)
      @data = @data.first if @data.is_a?(Array)
      super
    end

    def to_json(*_args)
      @data.to_json
    end

    def respond_to_missing?(field, _include_private)
      return true if @data.is_a?(Hash) && @data.key?(field.to_s)

      super
    end

    def method_missing(field, *_args)
      if @data.is_a?(Hash) && @data.key?(field.to_s)
        value = @data[field.to_s]

        return case value
               when Array then value.map { |v| EnotasApi::JsonResult.new(@status_code, v.to_json) }
               when Hash then EnotasApi::JsonResult.new(@status_code, value.to_json)
               else value
               end
      end
      super
    end
  end
end
