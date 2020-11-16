# frozen_string_literal: true

require 'spec_helper'

class TestSortable
  include EnotasApi::Sortable
  attr_reader :params

  def param(k, v)
    (@params ||= {})[k] = v
    self
  end

  sortable %i[field1 field2]
end

RSpec.describe EnotasApi::Sortable do
  let(:instance) { TestSortable.new }

  describe ':asc' do
    it 'allow to sort using generic method' do
      instance.sort(:field1, :asc)

      expect(instance.params[:sortBy]).to eq(:field1)
      expect(instance.params[:sortDirection]).to eq(:asc)
    end

    it 'allow to sort using specific method' do
      instance.sort_by_field1(:asc)

      expect(instance.params[:sortBy]).to eq(:field1)
      expect(instance.params[:sortDirection]).to eq(:asc)
    end
  end

  describe ':desc' do
    it 'allow to sort using generic method' do
      instance.sort(:field1, :desc)

      expect(instance.params[:sortBy]).to eq(:field1)
      expect(instance.params[:sortDirection]).to eq(:desc)
    end

    it 'allow to sort using specific method' do
      instance.sort_by_field1(:desc)

      expect(instance.params[:sortBy]).to eq(:field1)
      expect(instance.params[:sortDirection]).to eq(:desc)
    end
  end

  it 'only supports one sort a time' do
    instance.sort_by_field1
    instance.sort_by_field2

    expect(instance.params[:sortBy]).to eq(:field2)
    expect(instance.params[:sortDirection]).to eq(:asc)
  end

  it 'throw error when trying to sort by unespecified field' do
    expect { instance.sort(:another_field, :asc) }.to raise_error(EnotasApi::Error, /Unsupported sort field/)
  end

  it 'throw error when trying to sort by unespecified direction' do
    expect { instance.sort(:field1, :another) }.to raise_error(EnotasApi::Error, /Unsupported direction/)
  end
end
