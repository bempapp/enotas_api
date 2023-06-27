# frozen_string_literal: true

require 'bigdecimal'
require 'date'

module EnotasApi
  class TypeHandler
    VALIDATOR = {
      boolean: ->(value, _type) { value.is_a?(TrueClass) || value.is_a?(FalseClass) },
      decimal: ->(value, _type) { value.is_a?(Float) || value.is_a?(Integer) || value.is_a?(BigDecimal) },
      integer: ->(value, _type) { value.is_a?(Integer) },
      string: ->(value, _type) { value.is_a?(String) },
      datetime: ->(value, _type) { value.is_a?(DateTime) || value.is_a?(Date) },
      array: ->(value, _type) { value.is_a?(Array) },
      entity: ->(value, type) { value.is_a?(type) || value.is_a?(Hash) }
    }.freeze

    def initialize(type)
      @type = type
      @validator_type = type.is_a?(Class) && type < EnotasApi::Entity ? :entity : type
      @validator = VALIDATOR[@validator_type]
      raise EnotasApi::Error, "Type #{type} not supported" unless @validator
    end

    def entity?
      @validator_type == :entity
    end

    def validate!(value)
      return if value.nil? || @validator.call(value, @type)

      raise EnotasApi::Error, "Invalid value set '#{value}:#{value.class}' for type '#{@type}'"
    end
  end
end
