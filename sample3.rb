# frozen_string_literal: true
# rubocop:disable all

require_relative 'lib/enotas_api'

EnotasApi::Configuration.configure(api_key: 'Nzk2ZGViNWUtYWY0YS00M2Y3LThhMjEtZGU4MTYzODkwNjAw')

puts EnotasApi::V1::ConsultarNfs.new('B90C486B-B53E-48A6-8F94-141F83980600', 'development:nfs:2:1:bu').call.to_json
