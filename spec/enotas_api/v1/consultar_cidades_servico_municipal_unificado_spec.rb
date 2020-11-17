# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::ConsultarCidadesServicoMunicipalUnificado do
  let(:instance) { described_class.new }

  it 'implements uri' do
    expect(instance.uri).to eq('/v1/servicos/cidades')
  end

  it 'allow pagination' do
    expect(instance.respond_to?(:page)).to be true
  end
end
