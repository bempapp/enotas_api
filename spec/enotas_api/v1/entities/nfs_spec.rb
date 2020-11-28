# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::Nfs do
  let(:data) do
    {
      idExterno: 'idExterno', ambienteEmissao: 'ambienteEmissao', enviarPorEmail: true,
      numeroRps: 99, serieRps: 'serieRps', tipo: 'tipo', dataCompetencia: DateTime.now,
      naturezaOperacao: 'naturezaOperacao', deducoes: 99.9, descontos: 99.9, observacoes: 'observacoes',
      dadosAdicionaisEmail: { outrosDestinatarios: 'outrosDestinatarios' },
      cliente: { nome: 'nome' }, servico: { descricao: 'descricao' }, valorTotal: 99.9
    }
  end

  let(:json_data) { data.merge(dataCompetencia: data[:dataCompetencia].to_time.utc.iso8601) }

  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(JSON.parse(instance.to_json)).to eq(JSON.parse(json_data.to_json))
  end
end
