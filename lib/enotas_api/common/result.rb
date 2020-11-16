# frozen_string_literal: true

require 'json'

module EnotasApi
  class Result
    attr_reader :status_code

    def initialize(status_code, json)
      @status_code = status_code
      @data = JSON.parse(json)
    end

    def success?
      @status_code.between?(200, 299)
    end

    def error?
      !success?
    end

    def to_json(*_args)
      @data.to_json
    end

    def respond_to_missing?(field, _include_private)
      return true if @data.key?(field.to_s)

      super
    end

    def method_missing(field, *_args)
      if @data.key?(field.to_s)
        value = @data[field.to_s]

        return case value
               when Array then value.map { |v| EnotasApi::Result.new(@status_code, v.to_json) }
               when Hash then EnotasApi::Result.new(@status_code, value.to_json)
               else value
               end
      end
      super
    end
  end
end
