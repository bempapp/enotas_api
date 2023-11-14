# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::Empresa do
  let(:data) do
    { id: 'id',
      cnpj: 'cnpj',
      inscricaoMunicipal: 'inscricaoMunicipal',
      inscricaoEstadual: 'inscricaoEstadual',
      razaoSocial: 'razaoSocial',
      nomeFantasia: 'nomeFantasia',
      optanteSimplesNacional: true,
      email: 'email',
      telefoneComercial: 'telefoneComercial',
      endereco: { cidade: 'City' },
      emissaoNFeProduto: { ambienteHomologacao: { sequencialNFe: 123 } },
      emissaoNFeConsumidor: { ambienteHomologacao: { sequencialNFe: 123, csc: { id: '123' } } } }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
