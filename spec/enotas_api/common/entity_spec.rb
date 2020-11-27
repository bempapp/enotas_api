# frozen_string_literal: true

require 'spec_helper'

class TestEntity < EnotasApi::Entity
  attribute :boolean_attr, :boolean
  attribute :decimal_attr, :decimal
  attribute :integer_attr, :integer
  attribute :string_attr, :string
  attribute :unset_attr, :string
  attribute :entity_attr, TestEntity
end

RSpec.describe EnotasApi::Entity do
  let(:data) do
    { decimal_attr: 9.99, integer_attr: 10, string_attr: 'value',
      entity_attr: { boolean_attr: nil, string_attr: 'another_value' } }
  end
  let(:instance) { TestEntity.new(data) }

  describe '#as_json' do
    it 'retrieves attributes map to have right json support in rails' do
      expect(instance.as_json).to eq(
        decimal_attr: 9.99, integer_attr: 10, string_attr: 'value',
        entity_attr: { boolean_attr: nil, string_attr: 'another_value' }
      )
    end
  end

  describe '#to_json' do
    let(:json) { instance.to_json }
    let(:json_object) { JSON.parse(json) }

    it 'not render nil attributes not changed' do
      expect(json_object.key?('boolean_attr')).to be false
    end

    it 'render entity attributes' do
      expect(json_object['entity_attr'].class).to eq(Hash)
    end

    it 'render all attributes as json' do
      expect(json).to eq(data.to_json)
    end
  end
end
