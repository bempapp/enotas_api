# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::Configuration do
  let(:conf) { described_class }
  let(:current) { conf.current }
  let(:api_key) { 'test-api-key' }

  it 'its mandatory to configure' do
    expect { current }.to raise_error(EnotasApi::Error, /necessary to configure EnotasApi/)
  end

  describe '#api_key' do
    it 'is mandatory' do
      expect { conf.configure }.to raise_error(ArgumentError)
    end

    it 'retrieve the key' do
      conf.configure(api_key:)

      expect(current.api_key).to eq(api_key)
    end
  end

  describe '#request_provider' do
    it 'uses RequestProvider by default' do
      conf.configure(api_key:)

      expect(current.request_provider.class).to eq(EnotasApi::RequestProvider)
    end

    it 'allow to override default' do
      custom = instance_double(EnotasApi::RequestProvider)

      conf.configure(api_key:, request_provider: custom)

      expect(current.request_provider).to eq(custom)
    end
  end

  describe '#base_url' do
    it 'has production url by default' do
      conf.configure(api_key:)

      expect(current.base_url).to eq('https://api.enotasgw.com.br')
    end

    it 'allow to override default' do
      custom_url = 'http://example.com'

      conf.configure(api_key:, base_url: custom_url)

      expect(current.base_url).to eq(custom_url)
    end
  end

  describe '#logger' do
    it 'has a default logger' do
      conf.configure(api_key:)

      expect(current.logger).to respond_to(:info)
    end

    it 'allow to configure logger' do
      message = 'hello logger'
      custom_logger = instance_double(Logger, info: nil)
      conf.configure(api_key:, logger: custom_logger)

      current.logger.info('hello logger')

      expect(custom_logger).to have_received(:info).with(message)
    end
  end
end
