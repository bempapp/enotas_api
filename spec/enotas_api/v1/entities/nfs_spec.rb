# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::Nfs do
  let(:data) do
    {
      idExterno: 'idExterno', ambienteEmissao: 'ambienteEmissao', enviarPorEmail: true,
      cliente: { nome: 'nome' }, endereco: { logradouro: 'logradouro' }, servico: { descricao: 'descricao' },
      valorTotal: 99
    }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
