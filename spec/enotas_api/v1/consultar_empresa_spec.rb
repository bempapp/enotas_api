# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::ConsultarEmpresa do
  let(:id) { 123 }
  let(:instance) { described_class.new(id) }

  it 'implements uri' do
    expect(instance.uri).to eq("/v1/empresas/#{id}")
  end
end
