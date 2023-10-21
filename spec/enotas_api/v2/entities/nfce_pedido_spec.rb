# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::NfcePedido do
  let(:data) do
    {
      presencaConsumidor: 'OperacaoPresencial',
      pagamento: {
        tipo: 'PagamentoAVista',
        formas: [
          {
            tipo: 'Dinheiro',
            valor: 0
          },
          {
            tipo: 'CartaoDeCredito',
            valor: 0,
            credenciadoraCartao: {
              tipoIntegracaoPagamento: 'IntegradoAoSistemaDeGestao',
              cnpjCredenciadoraCartao: '00000000000000',
              bandeira: 'Visa',
              autorizacao: '{1-20}'
            }
          }
        ]
      }
    }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
