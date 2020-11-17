# frozen_string_literal: true

require 'json'
require_relative '../support/attributable'

module EnotasApi
  class Entity
    include EnotasApi::Attributable

    def to_json(options = nil)
      self.class.attributes.keys
          .map { |att| [att, send(att)] }
          .reject { |e| e[1].nil? && !attribute_changed?(e[0]) }
          .to_h.to_json(options)
    end
  end
end
