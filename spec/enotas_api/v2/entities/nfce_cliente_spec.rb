# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::NfceCliente do
  let(:data) do
    { endereco: { pais: 'Country',
                  uf: 'State',
                  cidade: 'City',
                  logradouro: 'Street',
                  numero: 'Number',
                  complemento: 'Additional Info',
                  bairro: 'Neighborhood',
                  cep: 'Code' },
      tipoPessoa: 'PF',
      nome: 'Name',
      email: 'email@email.com',
      cpfCnpj: 'cpfCnpj',
      inscricaoMunicipal: 'string',
      inscricaoEstadual: 'string',
      indicadorContribuinteICMS: 'string',
      telefone: 'string' }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
