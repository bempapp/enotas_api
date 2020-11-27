# frozen_string_literal: true

require 'json'
require_relative '../support/attributable'

module EnotasApi
  class Entity
    include EnotasApi::Attributable

    def as_json(_options = nil)
      self.class.attributes.keys
          .map { |att| [att, json_value(att)] }
          .reject { |e| e[1].nil? && !attribute_changed?(e[0]) }
          .to_h
    end

    def to_json(options = nil)
      as_json.to_json(options)
    end

    private

    def json_value(attr)
      value = send(attr)
      value.is_a?(EnotasApi::Entity) ? value.as_json : value
    end
  end
end
