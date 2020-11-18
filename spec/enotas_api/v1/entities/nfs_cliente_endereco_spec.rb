# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::NfsClienteEndereco do
  let(:data) { { logradouro: 'logradouro', numero: 'numero', complemento: 'complemento', bairro: 'bairro', cep: 'cep', uf: 'uf', cidade: 'cidade' } }
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
