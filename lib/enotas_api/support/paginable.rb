# frozen_string_literal: true

module EnotasApi
  module Paginable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def paginable
        define_method :page do |number: 0, size: 150|
          param(:pageNumber, number).param(:pageSize, size)
        end
      end
    end
  end
end
