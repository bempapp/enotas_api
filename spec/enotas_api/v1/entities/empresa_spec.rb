# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::Empresa do
  let(:data) do
    { id: 'id', cnpj: 'cnpj', inscricaoMunicipal: 'inscricaoMunicipal', inscricaoEstadual: 'inscricaoEstadual',
      razaoSocial: 'razaoSocial', nomeFantasia: 'nomeFantasia', optanteSimplesNacional: true, email: 'email',
      telefoneComercial: 'telefoneComercial', incentivadorCultural: false, regimeEspecialTributacao: 'regimeEspecialTributacao',
      codigoServicoMunicipal: 'codigoServicoMunicipal', cnae: 'cnae', aliquotaIss: 9.99, descricaoServico: 'descricaoServico',
      endereco: { codigoIbgeUf: 123 }, configuracoesNFSeHomologacao: { sequencialNFe: 1 }, configuracoesNFSeProducao: { sequencialNFe: 1 } }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
