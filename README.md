# EnotasApi (WORK IN PROGRESS)
*enotas_api* é um cliente ruby para a [API](https://docs.enotasgw.com.br/reference) do [e-notas](https://enotas.com.br/).

Não oficial, porém com design simples e suportada com carinho por [@salaozen](https://github.com/salaozen).

## English Readers
*enotas_api* is a ruby api client for [e-notas](https://enotas.com.br/) [API](https://docs.enotasgw.com.br/reference).

Non oficial, but well supported with love by [@salaozen](https://github.com/salaozen).

Because e-notas api is entire in portuguese, the code and documentation from here will also be. Sorry about that. :D

## Dependencias
EnotasApi não depende de nenhuma Gem externa para executar, (aloha dependency hell).
Porém implementamos utilizamos a versão que ruby que temos em produção atualmente que é `~> ruby 2.6.6`.
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

## Utilização (WIP)

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

### Lista de objetos disponiveis
```ruby
EnotasApi::V1::ConsultarCaracteristicasPrefeitura.new(codigo_ibge_cidade)

EnotasApi::V1::ConsultarCidadesServicoMunicipalUnificado.new

EnotasApi::V1::ConsultarEmpresa.new(id)

EnotasApi::V1::ConsultarServicosMunicipais.new(uf, nome_cidade)

EnotasApi::V1::ListarEmpresas.new
```

## Endpoints suportados (marcados com X) e em desenvolvimento (sem marcação)
API - NFS-e (V1) - [Documentação](https://docs.enotasgw.com.br/reference)
- [x] Empresa: Consultar Empresa
- [x] Empresa: Listar Empresas
- [x] Empresa: Incluir / Atualizar Empresa
- [ ] Empresa: Vincular Certificado
- [ ] Empresa: Vincular Logotipo
- [x] Empresa: Desabilitar Empresa
- [x] Empresa: Habilitar Empresa
- [x] NFS-E: Listar Notas Fiscais
- [x] NFS-E: Consultar pelo ID do Gateway
- [x] NFS-E: Consultar pelo Id Externo
- [ ] NFS-E: Download XML
- [ ] NFS-E: Download XML (IdExterno)
- [ ] NFS-E: Download PDF
- [ ] NFS-E: Download PDF (IdExterno)
- [ ] NFS-E: Emissão de Nota Fiscal
- [ ] NFS-E: Cancelar
- [ ] NFS-E: Cancelar (IdExterno)
- [x] API Complementar: Serviços Municipais da Cidade
- [x] API Complementar: Características da Prefeitura
- [x] API Complementar: Cidades com Serviço Municipal Unificado

API - NF-e & NFC-e (v2) - [Documentação](https://docs.enotasgw.com.br/v2/reference)
- [ ] Empresa: Incluir/Alterar Empresa
- [ ] Empresa: Vincular Certificado
- [ ] Empresa: Vincular Logotipo
- [ ] Empresa: Consultar Empresa
- [ ] Empresa: Listar Empresas
- [ ] NFC-E: Emitir Nota Fiscal
- [ ] NFC-E: Consultar Nota Fiscal
- [ ] NFC-E: Consultar XML
- [ ] NFC-E: Cancelar Nota Fiscal
- [ ] NFC-E: Consultar XML de Envio do Cancelamento
- [ ] NFC-E: Consultar XML de Retorno do Cancelamento
- [ ] NFC-E: Inutilizar Numeração
- [ ] NFC-E: Consultar Inutilização de Número da Nota Fiscal
- [ ] NFC-E: Consultar XML de Inutilização
- [ ] NF-E: Emitir Nota Fiscal
- [ ] NF-E: Consultar Nota Fiscal
- [ ] NF-E: Cancelar Nota Fiscal
- [ ] NF-E: Consultar XML de Cancelamento
- [ ] NF-E: Emitir Carta de Correção pela Chave da NF-e
- [ ] NF-E: Consultar Carta de Correção
- [ ] NF-E: Consultar XML da Carta de Correção
- [ ] NF-E: Inutilizar Numeração
- [ ] NF-E: Consultar Inutilização de Número da Nota Fiscal
- [ ] NF-E: Consultar XML de Inutilização
- [ ] S@T - SÃO PAULO: Download EXE customizado do S@T
- [ ] Consulta de nota prestada (emitida): NFS-e - Consulta de Nota Prestada (Emitida)
- [ ] Consulta de nota tomada (recebida): NF-e - Consulta de Nota Tomada (Recebida)
- [ ] Consulta de nota tomada (recebida): NF-e - Consulta de Nota Tomada sem manifestação
- [ ] Consulta de nota tomada (recebida): NFS-e - Consulta de Nota Tomada (Recebida)
- [ ] Manifestação de destinatário - NF-E: Manifestação de Destinatário (NF-e)
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/enotas_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/enotas_api/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EnotasApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/enotas_api/blob/master/CODE_OF_CONDUCT.md).
