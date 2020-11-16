# frozen_string_literal: true

require_relative 'conversion_helper'

module EnotasApi
  module DynamicAttributes
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
      attributes_changed.includes?(attribute)
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
      def attribute(name, type)
        raise EnotasApi::Error, "Type #{type} not supported" unless EnotasApi::ConversionHelper.support_type?(type)

        (@attributes ||= {})[name] = type

        define_method name do
          instance_variable_get("@#{name}")
        end

        define_method "#{name}=" do |value|
          instance_variable_set("@#{name}", EnotasApi::ConversionHelper.convert_value(type, value))
          (@attributes_changed ||= []) << name
        end
      end

      def attributes
        (@attributes || {}).freeze
      end
    end
  end
end
