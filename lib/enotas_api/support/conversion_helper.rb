# frozen_string_literal: true

module EnotasApi
  module ConversionHelper
    TYPE_HANDLERS = {
      boolean: ->(value) { value == 'true' },
      decimal: ->(value) { value.to_f },
      entity: ->(_value) {},
      integer: ->(value) { value.to_i },
      string: ->(value) { value }
    }.freeze

    def self.support_type?(type)
      !type_handler(type).nil?
    end

    def self.type_handler(type)
      type = :entity if type.is_a?(Class) && type <= EnotasApi::Entity
      TYPE_HANDLERS[type]
    end

    def self.convert_value(type, value)
      return nil if value.nil?

      str_value = value.to_s
      return nil if type != :string && str_value.empty?

      type_handler(type).call(str_value)
    end
  end
end
