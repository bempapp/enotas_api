# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::EmpresaEmissaoNfeProduto do
  let(:data) do
    { ambienteProducao: { sequencialNFe: 999, serieNFe: '999', sequencialLoteNFe: 999 },
      ambienteHomologacao: { sequencialNFe: 111, serieNFe: '111', sequencialLoteNFe: 111 } }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
