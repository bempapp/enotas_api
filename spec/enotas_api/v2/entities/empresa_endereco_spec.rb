# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::EmpresaEndereco do
  let(:data) do
    { uf: 'State',
      cidade: 'City',
      logradouro: 'Street',
      numero: 'Number',
      complemento: 'Additional Info',
      bairro: 'Neighborhood',
      cep: 'Code' }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
