# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::Error do
  it 'is a StandardError' do
    message = 'error message'

    expect { raise described_class, message }.to raise_error(StandardError, message)
  end
end
