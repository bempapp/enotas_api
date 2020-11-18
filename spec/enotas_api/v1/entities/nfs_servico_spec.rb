# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::NfsServico do
  let(:data) do
    {
      descricao: 'descricao', aliquotaIss: 9.9, issRetidoFonte: true, cnae: 'cnae',
      codigoServicoMunicipio: 'codigoServicoMunicipio',
      valorPis: 99, valorCofins: 99, valorCsll: 99, valorInss: 99, valorIr: 99
    }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
