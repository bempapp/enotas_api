# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::ListarEmpresas do
  let(:instance) { described_class.new }

  it 'implements uri' do
    expect(instance.uri).to eq('/v1/empresas')
  end

  it 'allow pagination' do
    expect(instance.respond_to?(:page)).to eq true
  end

  it 'allow search by expected fields' do
    expect(instance.respond_to?(:search)).to eq true
    expect(instance.respond_to?(:search_by_nome_fantasia)).to eq true
    expect(instance.respond_to?(:search_by_razao_social)).to eq true
  end

  it 'allow sort by expected fields' do
    expect(instance.respond_to?(:sort)).to eq true
    expect(instance.respond_to?(:sort_by_nome_fantasia)).to eq true
    expect(instance.respond_to?(:sort_by_razao_social)).to eq true
    expect(instance.respond_to?(:sort_by_cidade)).to eq true
    expect(instance.respond_to?(:sort_by_data_criacao)).to eq true
    expect(instance.respond_to?(:sort_by_data_ultima_modificacao)).to eq true
  end
end
