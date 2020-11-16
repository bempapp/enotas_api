# frozen_string_literal: true

module EnotasApi
  module Sortable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      DIRECTIONS = %i[asc desc].freeze

      def sortable(fields)
        define_method :sort do |field, direction|
          raise "Unsupported sort field '#{field}', valid sort fields are #{fields}." unless fields.include?(field)
          raise "Unsupported direction '#{direction}'', valid directions are #{DIRECTIONS}." unless DIRECTIONS.include?(direction)

          param(:sortBy, field).param(:sortDirection, direction)
        end

        fields.each do |field|
          define_method "sort_by_#{field}" do |direction = :asc|
            sort(field, direction)
          end
        end
      end
    end
  end
end
