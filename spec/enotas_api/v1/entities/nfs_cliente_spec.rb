# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::NfsCliente do
  let(:data) do
    {
      tipoPessoa: 'tipoPessoa', nome: 'nome', email: 'email', cpfCnpj: 'cpfCnpj',
      inscricaoMunicipal: 'inscricaoMunicipal', inscricaoEstadual: 'inscricaoEstadual', telefone: 'telefone',
      endereco: { logradouro: 'logradouro' }
    }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(JSON.parse(instance.to_json)).to eq(JSON.parse(data.to_json))
  end
end
