# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::NfceItem do
  let(:data) do
    { cfop: 'string',
      codigo: 'string',
      descricao: 'string',
      sku: 'string',
      ncm: 'string',
      cest: 'string',
      quantidade: 0,
      unidadeMedida: 'string',
      valorUnitario: 0,
      impostos: { percentualAproximadoTributos: { simplificado: { percentual: 0 },
                                                  detalhado: { percentualFederal: 0,
                                                               percentualEstadual: 0,
                                                               percentualMunicipal: 0 },
                                                  fonte: 'string' },
                  icms: { situacaoTributaria: 'string',
                          origem: 0,
                          aliquota: 0,
                          baseCalculo: 0,
                          modalidadeBaseCalculo: 0,
                          percentualReducaoBaseCalculo: 0,
                          baseCalculoST: 0,
                          aliquotaST: 0,
                          modalidadeBaseCalculoST: 0,
                          percentualReducaoBaseCalculoST: 0,
                          percentualMargemValorAdicionadoST: 0 },
                  pis: { situacaoTributaria: 'string',
                         porAliquota: { aliquota: 0 },
                         porValor: { valorPorUnidade: 0 } },
                  cofins: { situacaoTributaria: 'string',
                            porAliquota: { aliquota: 0 },
                            porValor: { valorPorUnidade: 0 } },
                  ipi: { situacaoTributaria: 'string',
                         porAliquota: { aliquota: 0 },
                         porValor: { valorPorUnidade: 0 } } },
      informacoesAdicionais: 'string',
      ean: 'string',
      eanTributavel: 'string' }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
