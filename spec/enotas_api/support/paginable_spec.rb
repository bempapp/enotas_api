# frozen_string_literal: true

require 'spec_helper'

class TestPaginable
  include EnotasApi::Paginable
  attr_reader :params

  def param(k, v)
    (@params ||= {})[k] = v
    self
  end

  paginable
end

RSpec.describe EnotasApi::Paginable do
  let(:instance) { TestPaginable.new }

  it 'allow to customize page number' do
    instance.page(number: 10)

    expect(instance.params[:pageNumber]).to eq(10)
  end

  it 'allow to customize page size' do
    instance.page(size: 50)

    expect(instance.params[:pageSize]).to eq(50)
  end
end
