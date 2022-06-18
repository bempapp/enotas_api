# frozen_string_literal: true
# rubocop:disable all

require_relative 'lib/enotas_api'

EnotasApi::Configuration.configure(api_key: 'Nzk2ZGViNWUtYWY0YS00M2Y3LThhMjEtZGU4MTYzODkwNjAw')

sz = EnotasApi::V1::Empresa.new({
                                  id: 'b90c486b-b53e-48a6-8f94-141f83980600',
                                  cnpj: '31552469000167',
                                  inscricaoMunicipal: '61114626',
                                  razaoSocial: 'Salão Zen Desenvolvimento de Sistemas LTDA',
                                  nomeFantasia: 'Salão Zen',
                                  optanteSimplesNacional: true,
                                  email: 'administrativo@salaozen.com.br',
                                  telefoneComercial: '51 993286954',
                                  aliquotaIss: 2.0,
                                  regimeEspecialTributacao: '6',
                                  # codigoServicoMunicipal: '010100100',
                                  # descricaoServico: 'Análise de sistemas',
                                  # itemListaServicoLC116: '1.01',
                                  endereco: {
                                    codigoIbgeUf: 43,
                                    codigoIbgeCidade: 4_314_902,
                                    pais: 'Brasil',
                                    uf: 'RS',
                                    cidade: 'Porto Alegre',
                                    logradouro: 'Avenida Jose Aloisio Filho',
                                    numero: '411',
                                    complemento: '266',
                                    bairro: 'Humaitá',
                                    cep: '90250180'
                                  },
                                  configuracoesNFSeHomologacao: {
                                    sequencialNFe: 1,
                                    serieNFe: '1',
                                    sequencialLoteNFe: 1,
                                    usuarioAcessoProvedor: nil,
                                    senhaAcessoProvedor: nil,
                                    tokenAcessoProvedor: nil
                                  },
                                  configuracoesNFSeProducao: {
                                    sequencialNFe: 682,
                                    serieNFe: '1',
                                    sequencialLoteNFe: 682,
                                    usuarioAcessoProvedor: nil,
                                    senhaAcessoProvedor: nil,
                                    tokenAcessoProvedor: nil
                                  }
                                })

nfs = EnotasApi::V1::Nfs.new(
  idExterno: "teste-#{Random.rand(999_999_999)}",
  ambienteEmissao: 'Homologacao',
  enviarPorEmail: true,
  cliente: {
    tipoPessoa: 'F',
    nome: 'Luis Eduardo Bohrer da Silva',
    email: 'eduardo@salaozen.com.br',
    cpfCnpj: '00910366071',
    endereco: {
      uf: 'RS',
      cidade: 'Porto Alegre',
      logradouro: 'Avenida Jose Aloisio Filho',
      numero: '411',
      complemento: '266',
      bairro: 'Humaitá',
      cep: '90250180'
    }
  },
  servico: {
    descricao: 'Teste'
    # codigoInternoServicoMunicipal: "14283"
  },
  valorTotal: 1.0,
  observacoes: 'Teste'
)

# json_nota = EnotasApi::V1::EmitirNfs.new(sz.id, nfs).call
# puts 'JSON NOTA', json_nota.to_json

# puts EnotasApi::V1::ConsultarNfs.new(sz.id, json_nota.nfeId).call.to_json

nfId = 'abb97f74-f98b-4dbb-a48b-1c1991d60600'
nfId = 'f2acaf7f-918a-4f67-8248-88b9c6d60600'
salonId = '0569139F-03F6-4189-A224-D546E49D0600'
puts EnotasApi::V1::ConsultarNfs.new(salonId, nfId).call.to_json

# "valorCofins":0.0,"valorCsll":0.0,"valorInss":0.0,"valorIr":0.0,"valorPis":0.0,","valorIss":48.0
