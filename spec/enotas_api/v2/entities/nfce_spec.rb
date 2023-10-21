# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::Nfce do
  let(:data) do
    {
      id: 'string',
      ambienteEmissao: 'Homologacao',
      naturezaOperacao: 'string',
      enviarPorEmail: true,
      pedido: {
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
      },
      cliente: {
        endereco: {
          pais: 'string',
          uf: 'string',
          cidade: 'string',
          logradouro: 'string',
          numero: 'string',
          complemento: 'string',
          bairro: 'string',
          cep: 'string'
        },
        tipoPessoa: 'string',
        nome: 'string',
        email: 'string',
        cpfCnpj: 'string',
        inscricaoMunicipal: 'string',
        inscricaoEstadual: 'string',
        indicadorContribuinteICMS: 'string',
        telefone: 'string'
      },
      itens: [
        {
          cfop: 'string',
          codigo: 'string',
          descricao: 'string',
          sku: 'string',
          ncm: 'string',
          cest: 'string',
          quantidade: 0,
          unidadeMedida: 'string',
          valorUnitario: 0,
          impostos: {
            percentualAproximadoTributos: {
              simplificado: {
                percentual: 0
              },
              detalhado: {
                percentualFederal: 0,
                percentualEstadual: 0,
                percentualMunicipal: 0
              },
              fonte: 'string'
            },
            icms: {
              situacaoTributaria: 'string',
              origem: 0,
              aliquota: 0,
              baseCalculo: 0,
              modalidadeBaseCalculo: 0,
              percentualReducaoBaseCalculo: 0,
              baseCalculoST: 0,
              aliquotaST: 0,
              modalidadeBaseCalculoST: 0,
              percentualReducaoBaseCalculoST: 0,
              percentualMargemValorAdicionadoST: 0
            },
            pis: {
              situacaoTributaria: 'string',
              porAliquota: {
                aliquota: 0
              }
            },
            cofins: {
              situacaoTributaria: 'string',
              porAliquota: {
                aliquota: 0
              }
            },
            ipi: {
              situacaoTributaria: 'string',
              porAliquota: {
                aliquota: 0
              }
            }
          },
          informacoesAdicionais: 'string'
        }
      ],
      informacoesAdicionais: 'string'
    }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
