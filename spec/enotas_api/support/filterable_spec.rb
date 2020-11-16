# frozen_string_literal: true

require 'spec_helper'

class TestFilterable
  include EnotasApi::Filterable
  attr_reader :params

  def param(k, v)
    (@params ||= {})[k] = v
    self
  end

  filterable :contains_field, :contains
  filterable :eq_field, :eq
end

RSpec.describe EnotasApi::Filterable do
  let(:instance) { TestFilterable.new }

  it 'add contains filter' do
    instance.contains_field_contains('value')

    expect(instance.params[:filter]).to eq("contains(contains_field 'value')")
  end

  it 'add eq filter' do
    instance.eq_field_eq('value')

    expect(instance.params[:filter]).to eq("eq_field eq 'value'")
  end
end
