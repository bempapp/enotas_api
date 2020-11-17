# frozen_string_literal: true

module EnotasApi
  module Attributable
    def self.included(base)
      base.extend ClassMethods
    end

    def initialize(**attrs)
      set(attrs)
    end

    def attributes_changed
      (@attributes_changed || []).freeze
    end

    def attribute_changed?(attribute)
      attributes_changed.include?(attribute)
    end

    def attributes
      self.class.attributes
    end

    def set(attributes)
      return if attributes&.empty?

      attributes.each_pair do |attr, value|
        method = "#{attr}="
        method = attr unless respond_to?(method)
        send(method, value)
      end

      self
    end

    module ClassMethods
      TYPES = {
        boolean: ->(value) { value.is_a?(TrueClass) || value.is_a?(FalseClass) },
        decimal: ->(value) { value.is_a?(Float) || value.is_a?(Integer) },
        entity: ->(value) { value.is_a?(EnotasApi::Entity) },
        integer: ->(value) { value.is_a?(Integer) },
        string: ->(value) { value.is_a?(String) }
      }.freeze

      def attribute(name, type)
        raise EnotasApi::Error, "Type #{type} not supported" unless TYPES.key?(type) || type < EnotasApi::Entity

        (@attributes ||= {})[name] = type

        attr_reader name

        define_method "#{name}=" do |value|
          unless value.nil? || TYPES[type].call(value)
            raise EnotasApi::Error, "Invalid value '#{value}:#{value.class}' for type '#{type}' in field '#{name}'"
          end

          instance_variable_set("@#{name}", value)
          (@attributes_changed ||= []) << name
        end
      end

      def attributes
        (@attributes || {}).freeze
      end
    end
  end
end
