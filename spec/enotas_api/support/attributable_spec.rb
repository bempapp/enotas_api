# frozen_string_literal: true

require 'spec_helper'

class TestAttributable < EnotasApi::Entity
  attribute :boolean_attr, :boolean
  attribute :decimal_attr, :decimal
  attribute :integer_attr, :integer
  attribute :string_attr, :string
  attribute :entity_attr, TestAttributable
end

RSpec.describe EnotasApi::Attributable do
  let(:instance) { TestAttributable.new }

  describe '#attribute' do
    describe ':string' do
      it 'create attribute' do
        value = 'expected'
        instance.string_attr = value
        expect(instance.string_attr).to eq(value)
      end

      it 'not allow set non string value' do
        expect { instance.string_attr = 1 }.to raise_error(EnotasApi::Error)
      end

      it 'allow to set nil' do
        instance.string_attr = 'value'
        instance.string_attr = nil
        expect(instance.string_attr).to be_nil
      end
    end

    describe ':integer' do
      it 'create attribute' do
        value = 999
        instance.integer_attr = value
        expect(instance.integer_attr).to eq(value)
      end

      it 'not allow set non integer value' do
        expect { instance.integer_attr = '1' }.to raise_error(EnotasApi::Error)
      end

      it 'allow to set nil' do
        instance.integer_attr = 1
        instance.integer_attr = nil
        expect(instance.integer_attr).to be_nil
      end
    end

    describe ':decimal' do
      it 'create attribute' do
        value = 99.9
        instance.decimal_attr = value
        expect(instance.decimal_attr).to eq(value)
      end

      it 'not allow set non decimal value' do
        expect { instance.decimal_attr = '1' }.to raise_error(EnotasApi::Error)
      end

      it 'allow to set nil' do
        instance.decimal_attr = 1.0
        instance.decimal_attr = nil
        expect(instance.decimal_attr).to be_nil
      end
    end

    describe ':boolean' do
      it 'create attribute as true' do
        value = true
        instance.boolean_attr = value
        expect(instance.boolean_attr).to be true
      end

      it 'create attribute as false' do
        value = false
        instance.boolean_attr = value
        expect(instance.boolean_attr).to be false
      end

      it 'not allow set non boolean value' do
        expect { instance.boolean_attr = 1 }.to raise_error(EnotasApi::Error)
      end

      it 'allow to set nil' do
        instance.boolean_attr = true
        instance.boolean_attr = nil
        expect(instance.boolean_attr).to be_nil
      end
    end

    describe ':entity' do
      it 'create attribute' do
        value = TestAttributable.new
        instance.entity_attr = value
        expect(instance.entity_attr).to eq(value)
      end

      it 'not allow set non entity value' do
        expect { instance.entity_attr = Object.new }.to raise_error(EnotasApi::Error)
      end

      it 'allow to set nil' do
        instance.entity_attr = TestAttributable.new
        instance.entity_attr = nil
        expect(instance.entity_attr).to be_nil
      end

      it 'allow to set entity as hash' do
        value = 'abc'
        instance.entity_attr = { string_attr: value }
        expect(instance.entity_attr.string_attr).to eq(value)
      end
    end
  end

  describe '#attributes' do
    it 'retrieves attributes' do
      expect(instance.class.attributes).to eq({
                                                boolean_attr: :boolean, decimal_attr: :decimal,
                                                integer_attr: :integer, string_attr: :string,
                                                entity_attr: TestAttributable
                                              })
    end

    it 'retrieve atributes from instance' do
      expect(instance.attributes).to eq(instance.class.attributes)
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
  end

  describe '#initialize' do
    it 'is posible to initialize entities with values' do
      entity = TestAttributable.new({ boolean_attr: true, decimal_attr: 9.9, integer_attr: 10, string_attr: 'str' })
      expect(entity.boolean_attr).to eq(true)
      expect(entity.decimal_attr).to eq(9.9)
      expect(entity.integer_attr).to eq(10)
      expect(entity.string_attr).to eq('str')
    end
  end

  describe '#attributes_changed' do
    it 'stores attributes change' do
      entity = TestAttributable.new
      entity.boolean_attr = true
      entity.integer_attr = 1

      expect(entity.attributes_changed.length).to eq 2
      expect(entity.attributes_changed).to include(:boolean_attr)
      expect(entity.attributes_changed).to include(:integer_attr)
      expect(entity.attribute_changed?(:boolean_attr)).to eq true
      expect(entity.attribute_changed?(:integer_attr)).to eq true
    end
  end
end
