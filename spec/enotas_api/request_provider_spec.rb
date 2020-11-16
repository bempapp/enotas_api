# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::RequestProvider do
  let(:provider) { described_class.new }
  let(:custom_headers) { { 'User-Agent' => 'test' } }
  let(:valid_json) { { valid: true }.to_json.to_s }

  before do
    EnotasApi::Configuration.configure(api_key: 'sample')
  end

  describe '#get' do
    it 'make request for http' do
      url = 'http://example.com/'

      stub_request(:get, url).with(headers: custom_headers).to_return(body: valid_json)

      result = provider.get(url, custom_headers)

      expect(result).to eq([200, valid_json])
    end

    it 'make request for https' do
      url = 'https://example.com/'

      stub_request(:get, url).with(headers: custom_headers).to_return(body: valid_json)

      result = provider.get(url, custom_headers)

      expect(result).to eq([200, valid_json])
    end
  end

  describe '#post' do
    it 'make request for http' do
      url = 'http://example.com/'

      stub_request(:post, url).with(body: valid_json, headers: custom_headers).to_return(body: valid_json)

      result = provider.post(url, valid_json, custom_headers)

      expect(result).to eq([200, valid_json])
    end

    it 'make request for https' do
      url = 'https://example.com/'

      stub_request(:post, url).with(body: valid_json, headers: custom_headers).to_return(body: valid_json)

      result = provider.post(url, valid_json, custom_headers)

      expect(result).to eq([200, valid_json])
    end
  end
end
