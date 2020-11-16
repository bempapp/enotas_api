# EnotasApi (WORK IN PROGRESS)
*enotas_api* é um cliente ruby para a [API](https://docs.enotasgw.com.br/reference) do [e-notas](https://enotas.com.br/).

Não oficial, porém com design simples e suportada com carinho por [@salaozen](https://github.com/salaozen).
## English Readers
*enotas_api* is a ruby api client for [e-notas](https://enotas.com.br/) [API](https://docs.enotasgw.com.br/reference).

Non oficial, but well supported with love by [@salaozen](https://github.com/salaozen).

Because e-notas api is entire in portuguese, the code and documentation from here will also be. Sorry about that. :D

## Instalação

Adicione ao seu Gemfile

```ruby
gem 'enotas_api'
```

E então execute:

    $ bundle install

Ou instale você mesmo com:

    $ gem install enotas_api

## Utilização


## Endpoints suportados (marcados com X) e em desenvolvimento (sem marcação)
API - NFS-e (V1) - [Documentação](https://docs.enotasgw.com.br/reference)
- [x] Empresa: Consultar Empresa
- [x] Empresa: Listar Empresas
- [ ] Empresa: Incluir / Atualizar Empresa
- [ ] Empresa: Vincular Certificado
- [ ] Empresa: Vincular Logotipo
- [ ] Empresa: Desabilitar Empresa
- [ ] Empresa: Habilitar Empresa
- [ ] NFS-E: Listar Notas Fiscais
- [ ] NFS-E: Consultar pelo ID do Gateway
- [ ] NFS-E: Consultar pelo Id Externo
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
