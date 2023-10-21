[![Gem Version](https://badge.fury.io/rb/enotas_api.svg)](https://badge.fury.io/rb/enotas_api)
[![Maintainability](https://api.codeclimate.com/v1/badges/41c671eb551e1c6c7cf1/maintainability)](https://codeclimate.com/github/bempapp/enotas_api/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/41c671eb551e1c6c7cf1/test_coverage)](https://codeclimate.com/github/bempapp/enotas_api/test_coverage)

# EnotasApi
*enotas_api* é um cliente ruby para a [API](https://docs.enotasgw.com.br/reference) do [e-notas](https://enotas.com.br/).

EnotasApi é uma gem não oficial porém com design simples, livre de dependências

Criada e mantida com carinho por [@bempapp](https://github.com/bempapp).

## English Readers
*enotas_api* is a ruby api client for [e-notas](https://enotas.com.br/) [API](https://docs.enotasgw.com.br/reference).

EnotasApi its a non oficial, but well with simple design an dependency free

Created and supported with love by [@bempapp](https://github.com/bempapp).

PS: Because e-notas api is entire in portuguese, the code and documentation from here will also be. Sorry about that. :D

## Dependencias
EnotasApi não depende de nenhuma Gem externa para executar, (aloha dependency hell).
Porém implementamos com a versão de ruby `>= ruby 3.1` que é compatível com a versão que temos em produção,  `~> ruby 3.2.2`.
Se tiver interesse em fazer backport para versões anteriores, não deixe de fazer seu comentário ou abrir um PR.

## Instalação

Adicione ao seu Gemfile

```ruby
gem 'enotas_api'
```

E então execute:
```sh
$ bundle install
```
Ou instale você mesmo com:
```sh
$ gem install enotas_api
```

## Utilização

Primeiro é necessário configurar o `EnotasApi`
```ruby
EnotasApi::Configuration.configure(api_key: '<sua api key>')
```
Você pode ver como conseguir sua API-KEY na [documentação do e-notas](https://docs.enotasgw.com.br/docs/como-obter-a-sua-api-key).

### Conceitos
Enotas-API é dividida da mesma forma como os endpoints do e-notas para facilitar o uso e o entendimento da relação de nossa implementação com os endpoints documentos.
Portanto para cada endpoint disponíveis há um objeto em EnotasApi para.

### Alguns exemplos:

Este é um exemplo de uma consulta simples
```ruby
result = EnotasApi::V1::ConsultarCaracteristicasPrefeitura.new(codigo_ibge_cidade).call
result # é um objeto com todos os atributos retornados pela api do e-notas
result.tipoAutenticacao # = 1
result.helpTipoAutenticacao.certificadoDigital # = "Sua prefeitura exige a utilização de certificado digital, portanto, inclua aqui o arquivo de seu certificado A1."
```

Um exemplo um pouco mais complexo onde se pode utilizar os recursos de filtro, ordenação e paginação suportados pela API.
```ruby
result = EnotasApi::V1::ListarEmpresas.new.search_by_nome_fantasia('nome_fantasia').sort_by_cidade.page(number: 10, size: 30).call
result.totalRecords # = 10
result.data.first.razaoSocial # = "Razão Social"
```

Todos os objetos lhe permitem também saber a URL e o json retornado pela API
```ruby
instance = EnotasApi::V1::ConsultarCaracteristicasPrefeitura.new(123)
instance.to_url # = "https://api.enotasgw.com.br/v1/estados/cidades/123/provedor"
result = instance.call
result.to_json # = <JSON retornado pela API do e-notas>
```

## Endpoints suportados (marcados com X) e em desenvolvimento (sem marcação)
Atualmente EnotasApi suporta por complexo a API V1 do enotas (NFS-e)
O suporte as novas APIs (V2) com suporte a NFC-e e NF-e estarão disponíveis em breve.

- [NFS-e (V1)](https://docs.enotasgw.com.br/reference)
  - Empresa
    - [x] Consultar Empresa - `EnotasApi::V1::ConsultarEmpresa`
    - [x] Listar Empresas - `EnotasApi::V1::ListarEmpresas`
    - [x] Incluir / Atualizar Empresa - `EnotasApi::V1::IncluirAtualizarEmpresa`
    - [x] Vincular Certificado - `EnotasApi::V1::VincularCertificado`
    - [x] Vincular Logotipo - `EnotasApi::V1::VincularLogotipo`
    - [x] Desabilitar Empresa - `EnotasApi::V1::DesabilitarEmpresa`
    - [x] Habilitar Empresa - `EnotasApi::V1::HabilitarEmpresa`
  - Nota Fiscal eletrônica de serviço (NFS-e)
    - [x] Listar Notas Fiscais - `EnotasApi::V1::ListarNotasFiscais`
    - [x] Consultar pelo ID do Gateway - `EnotasApi::V1::ConsultarNotaFiscal`
    - [x] Consultar pelo Id Externo - `EnotasApi::V1::ConsultarNotaFiscalIdExterno`
    - [x] Download XML - `EnotasApi::V1::BaixarXmlNfs`
    - [x] Download XML (IdExterno) - `EnotasApi::V1::BaixarXmlNfsIdExterno`
    - [x] Download PDF - `EnotasApi::V1::BaixarPdfNfs`
    - [x] Download PDF (IdExterno) - `EnotasApi::V1::BaixarPdfNfsIdExterno`
    - [X] Emissão de Nota Fiscal - `EnotasApi::V1::EmitirNfs`
    - [X] Cancelar - `EnotasApi::V1::CancelarNfs`
    - [X] Cancelar (IdExterno) - `EnotasApi::V1::CancelarNfsIdExterno`
  - API Complementar
    - [x] Serviços Municipais da Cidade - `EnotasApi::V1::ConsultarServicosMunicipais`
    - [x] Características da Prefeitura - `EnotasApi::V1::ConsultarCaracteristicasPrefeitura`
    - [x] Cidades com Serviço Municipal Unificado - `EnotasApi::V1::ConsultarCidadesServicoMunicipalUnificado`
- [NF-e & NFC-e (v2)](https://docs.enotasgw.com.br/v2/reference)
  - Empresa
    - [x] Incluir/Alterar Empresa
    - [x] Vincular Certificado
    - [x] Vincular Logotipo
    - [x] Consultar Empresa
    - [x] Listar Empresas
  - Nota Fiscal eletrônica de consumidor (NFC-e)
    - [x] Emitir Nota Fiscal
    - [x] Consultar Nota Fiscal
    - [x] Cancelar Nota Fiscal
    - [ ] Consultar XML
    - [ ] Consultar XML de Envio do Cancelamento
    - [ ] Consultar XML de Retorno do Cancelamento
    - [ ] Inutilizar Numeração
    - [ ] Consultar Inutilização de Número da Nota Fiscal
    - [ ] Consultar XML de Inutilização
  - Nota fiscal eletrônica de produto (NF-e)
    - [x] Emitir Nota Fiscal
    - [x] Consultar Nota Fiscal
    - [x] Cancelar Nota Fiscal
    - [ ] Consultar XML de Cancelamento
    - [ ] Emitir Carta de Correção pela Chave da NF-e
    - [ ] Consultar Carta de Correção
    - [ ] Consultar XML da Carta de Correção
    - [ ] Inutilizar Numeração
    - [ ] Consultar Inutilização de Número da Nota Fiscal
    - [ ] Consultar XML de Inutilização
  - S@T - SÃO PAULO
    - [ ] Download EXE customizado do S@T
  - Consulta de nota prestada (emitida)
    - [ ] NFS-e - Consulta de Nota Prestada (Emitida)
  - Consulta de nota tomada (recebida)
    - [ ] NF-e - Consulta de Nota Tomada (Recebida)
    - [ ] NF-e - Consulta de Nota Tomada sem manifestação
    - [ ] NFS-e - Consulta de Nota Tomada (Recebida)
  - Manifestação de destinatário NF-e
    - [ ] Manifestação de Destinatário (NF-e)

# Como liberar uma nova versão
1. Garantir cobertura de teste em 100% (para rodar os testes: rake check) 
1. Atualizar o [CHANGELOG](https://github.com/bempapp/enotas_api/blob/main/CHANGELOG.md)
1. Atualizar a versão em [version.rb](https://github.com/bempapp/enotas_api/blob/main/lib/enotas_api/version.rb)
1. Realizar o commit
1. Enviar ao repositório `git push origin main`
1. Criar uma tag `git tag <VERSAO> && git push origin <VERSAO>`
1. Gerar uma nova versão da gem `gem build enotas_api`
1. Publicar a gem `gem push enotas_api-<VERSAO>.gem`

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/bempapp/enotas_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/bempapp/enotas_api/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EnotasApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bempapp/enotas_api/blob/main/CODE_OF_CONDUCT.md).
