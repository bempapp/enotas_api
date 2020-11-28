# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::NfsDadosAdicionaisEmail do
  let(:data) { { outrosDestinatarios: 'outrosDestinatarios' } }
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
