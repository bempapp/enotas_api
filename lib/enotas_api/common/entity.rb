# frozen_string_literal: true

require 'json'
require_relative '../support/dynamic_attributes'

module EnotasApi
  class Entity
    include EnotasApi::DynamicAttributes

    def apply_json(json)
      json.each_pair do |field, value|
        setter = "#{field}="
        send(setter, value) if respond_to?(setter)
      end
      self
    end

    def as_json(_options = {})
      self.class.attributes
          .keys.map { |att| [att, send(att)] }
          .select { |e| !e[1].nil? || attribute_changed?(e[0]) }
          .to_h
    end

    def to_json(*options)
      as_json.to_json(*options)
    end
  end
end
