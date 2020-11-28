# frozen_string_literal: true

require 'json'
require 'date'
require 'time'
require_relative '../support/attributable'

module EnotasApi
  class Entity
    include EnotasApi::Attributable

    def as_json(_options = nil)
      attributes.keys
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
      return nil if value.nil?

      type = attribute_type(attr)

      return value.as_json if type.is_a?(Class)
      return value.to_time.utc.iso8601 if type == :datetime

      value
    end
  end
end
