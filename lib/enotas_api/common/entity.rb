# frozen_string_literal: true

require 'json'
require_relative '../support/attributable'

module EnotasApi
  class Entity
    include EnotasApi::Attributable

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
