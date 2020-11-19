# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::BaixarXmlNfsIdExterno do
  let(:empresa_id) { '123' }
  let(:id_externo) { '123' }
  let(:instance) { described_class.new(empresa_id, id_externo) }

  it 'have expected uri' do
    expect(instance.uri).to eq("/v1/empresas/#{empresa_id}/nfes/porIdExterno/#{id_externo}/xml")
  end

  it 'have expected result' do
    expect(instance.result_object).to eq(EnotasApi::JsonResult)
  end
end
