# frozen_string_literal: true

require 'spec_helper'

class TestEntity < EnotasApi::Entity
  attribute :boolean_attr, :boolean
  attribute :decimal_attr, :decimal
  attribute :integer_attr, :integer
  attribute :string_attr, :string
end

RSpec.describe EnotasApi::Entity do
  let(:instance) { TestEntity.new }

  describe '#attribute' do
    it 'create string attribute' do
      value = 'expected'
      instance.string_attr = value
      expect(instance.string_attr).to eq(value)
    end

    it 'create integer attribute' do
      value = 999
      instance.integer_attr = value
      expect(instance.integer_attr).to eq(value)
    end

    it 'create decimal attribute' do
      value = 99.9
      instance.decimal_attr = value
      expect(instance.decimal_attr).to eq(value)
    end

    it 'create boolean attribute as true' do
      value = true
      instance.boolean_attr = value
      expect(instance.boolean_attr).to be true
    end

    it 'convert false boolean value' do
      value = false
      instance.boolean_attr = value
      expect(instance.boolean_attr).to be false
    end

    describe '#attributes' do
      it 'retrieves attributes' do
        expect(instance.class.attributes).to eq({
                                                  boolean_attr: :boolean, decimal_attr: :decimal,
                                                  integer_attr: :integer, string_attr: :string
                                                })
      end
    end

    describe '#set' do
      it 'is posible to set multiple values at a time' do
        instance.set({ boolean_attr: true, decimal_attr: 9.9, integer_attr: 10, string_attr: 'str' })
        expect(instance.boolean_attr).to eq(true)
        expect(instance.decimal_attr).to eq(9.9)
        expect(instance.integer_attr).to eq(10)
        expect(instance.string_attr).to eq('str')
      end

      it 'throws error when trying to set invalid field' do
        expect { instance.set(another_field: 123) }.to raise_error(NoMethodError)
      end

      it 'is posible to initialize entities with values' do
        entity = TestEntity.new({ boolean_attr: true, decimal_attr: 9.9, integer_attr: 10, string_attr: 'str' })
        expect(entity.boolean_attr).to eq(true)
        expect(entity.decimal_attr).to eq(9.9)
        expect(entity.integer_attr).to eq(10)
        expect(entity.string_attr).to eq('str')
      end
    end
  end
end
