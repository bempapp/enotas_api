# frozen_string_literal: true

require 'json'
require 'spec_helper'

RSpec.describe EnotasApi::Result do
  describe 'status code' do
    let(:json) { { ok: true }.to_json.to_s }

    it 'recognize 200 range as success' do
      instance = described_class.new(200, json)

      expect(instance.success?).to be true
      expect(instance.error?).to be false
    end

    it 'recognize range 300 as error' do
      instance = described_class.new(300, json)

      expect(instance.success?).to be false
      expect(instance.error?).to be true
    end

    it 'recognize range 400 as error' do
      instance = described_class.new(400, json)

      expect(instance.success?).to be false
      expect(instance.error?).to be true
    end

    it 'recognize range 500 as error' do
      instance = described_class.new(500, json)

      expect(instance.success?).to be false
      expect(instance.error?).to be true
    end
  end

  describe 'json' do
    let(:json) do
      {
        string_field: 'string',
        boolean_true_field: true,
        boolean_false_field: false,
        decimal_field: 9.99,
        object_field: { object_internal: 'string' },
        array_field: [
          { array_interal: 'string-1' },
          { array_interal: 'string-2' }
        ]
      }.to_json.to_s
    end
    let(:instance) { described_class.new(200, json) }

    it 'recognize string fields' do
      expect(instance.string_field.class).to eq(String)
      expect(instance.string_field).to eq('string')
    end

    it 'recognize boolean fields' do
      expect(instance.boolean_true_field.class).to eq(TrueClass)
      expect(instance.boolean_false_field.class).to eq(FalseClass)

      expect(instance.boolean_true_field).to be true
      expect(instance.boolean_false_field).to be false
    end

    it 'recognize decimal fields' do
      expect(instance.decimal_field.class).to eq(Float)
      expect(instance.decimal_field).to eq(9.99)
    end

    it 'recognize object fields' do
      expect(instance.object_field.class).to eq(described_class)
      expect(instance.object_field.object_internal.class).to eq(String)
      expect(instance.object_field.object_internal).to eq('string')
    end

    it 'recognize array fields' do
      expect(instance.array_field.class).to eq(Array)
      expect(instance.array_field.length).to eq(2)

      expect(instance.array_field.first.class).to eq(described_class)
      expect(instance.array_field.last.class).to eq(described_class)

      expect(instance.array_field.first.array_interal).to eq('string-1')
      expect(instance.array_field.last.array_interal).to eq('string-2')
    end
  end

  describe 'to_json' do
    let(:json) { { fieldOne: 'valueOne', fieldTwo: 'valueTwo' }.to_json.to_s }
    let(:instance) { described_class.new(200, json) }

    it 'support convert to json' do
      expect(instance.to_json).to eq(json)
    end
  end
end
