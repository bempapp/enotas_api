# frozen_string_literal: true

module EnotasApi
  module Searchable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def searchable(fields)
        define_method :search do |field, value|
          raise EnotasApi::Error, "Unsupported search field '#{field}'" unless fields.include?(field)

          param(:searchBy, field).param(:searchTerm, value)
        end

        fields.each do |field|
          define_method "search_by_#{field}" do |value|
            search(field, value)
          end
        end
      end
    end
  end
end
