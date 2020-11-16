# frozen_string_literal: true

require 'spec_helper'

class TestSearchable
  include EnotasApi::Searchable
  attr_reader :params

  def param(k, v)
    (@params ||= {})[k] = v
    self
  end

  searchable %i[field1 field2]
end

RSpec.describe EnotasApi::Searchable do
  let(:instance) { TestSearchable.new }

  it 'allow to search using generic method' do
    instance.search(:field1, 'value')

    expect(instance.params[:searchBy]).to eq(:field1)
    expect(instance.params[:searchTerm]).to eq('value')
  end

  it 'allow to search using specific method' do
    instance.search_by_field1('value')

    expect(instance.params[:searchBy]).to eq(:field1)
    expect(instance.params[:searchTerm]).to eq('value')
  end

  it 'only supports one search a time' do
    instance.search_by_field1('value1')
    instance.search_by_field2('value2')

    expect(instance.params[:searchBy]).to eq(:field2)
    expect(instance.params[:searchTerm]).to eq('value2')
  end

  it 'throw error when trying to search by unespecified field' do
    expect { instance.search(:another_field, 'value') }.to raise_error(EnotasApi::Error, /Unsupported search field/)
  end
end
