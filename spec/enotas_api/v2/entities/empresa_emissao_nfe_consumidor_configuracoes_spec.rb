# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::EmpresaEmissaoNfeConsumidorConfiguracoes do
  let(:data) do
    { sequencialNFe: 999, serieNFe: '999', csc: { id: '999', codigo: '999' } }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
