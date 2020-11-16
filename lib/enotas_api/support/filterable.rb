# frozen_string_literal: true

module EnotasApi
  module Filterable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      FILTER_HANDLERS = {
        eq: ->(field, value) { "#{field} eq '#{value}'" },
        contains: ->(field, value) { "contains(#{field} '#{value}')" }
      }.freeze

      def filterable(field, type)
        handler = FILTER_HANDLERS[type]

        raise EnotasApi::Error, "Undefined filter type '#{type}', valid values are #{FILTER_HANDLERS.keys}" unless handler

        define_method "#{field}_#{type}" do |value|
          param(:filter, handler.call(field, value))
        end
      end
    end
  end
end
