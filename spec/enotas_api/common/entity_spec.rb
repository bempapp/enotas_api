# frozen_string_literal: true

require 'spec_helper'

class TestEntity < EnotasApi::Entity
  attribute :boolean_attr, :boolean
  attribute :decimal_attr, :decimal
  attribute :integer_attr, :integer
  attribute :string_attr, :string
  attribute :datetime_attr, :datetime
  attribute :unset_attr, :string
  attribute :entity_attr, TestEntity
end

RSpec.describe EnotasApi::Entity do
  let(:datetime) { DateTime.now }
  let(:json_data) do
    { decimal_attr: 9.99, integer_attr: 10, string_attr: 'value', datetime_attr: datetime.to_time.utc.iso8601,
      entity_attr: { boolean_attr: nil, string_attr: 'another_value' } }
  end
  let(:instance) do
    TestEntity.new(decimal_attr: 9.99, integer_attr: 10, string_attr: 'value', datetime_attr: datetime,
                   entity_attr: { boolean_attr: nil, string_attr: 'another_value' })
  end

  describe '#as_json' do
    it 'retrieves attributes map to have right json support in rails' do
      expect(instance.as_json).to eq(json_data)
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
      expect(json).to eq(json_data.to_json)
    end

    it 'render datetime with expected format' do
      expect(json_object['datetime_attr']).to eq(datetime.to_time.utc.iso8601)
    end
  end
end
