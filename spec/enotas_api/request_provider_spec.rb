# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::RequestProvider do
  let(:provider) { described_class.new }
  let(:url) { 'https://example.com/' }
  let(:valid_json) { { valid: true }.to_json.to_s }

  before do
    EnotasApi::Configuration.configure(api_key: 'sample')
  end

  describe 'headers' do
    it 'add authorization header' do
      stub_request(:get, url).with(headers: { Authorization: 'Basic sample' }).to_return(body: valid_json)

      result = provider.get(url)

      expect(result).to eq([200, valid_json])
    end

    it 'add json content-type' do
      stub_request(:get, url).with(headers: { 'Content-Type': 'application/json' }).to_return(body: valid_json)

      result = provider.get(url)

      expect(result).to eq([200, valid_json])
    end

    it 'add EnotasApi user-agent' do
      stub_request(:get, url).with(headers: { 'User-Agent': 'Enotas-Ruby-SDK' }).to_return(body: valid_json)

      result = provider.get(url)

      expect(result).to eq([200, valid_json])
    end

    it 'add json accept' do
      stub_request(:get, url).with(headers: { 'Accept': 'application/json' }).to_return(body: valid_json)

      result = provider.get(url)

      expect(result).to eq([200, valid_json])
    end
  end

  describe '#get' do
    it 'make request for http' do
      http_url = 'http://example.com/'
      stub_request(:get, http_url).to_return(body: valid_json)

      result = provider.get(http_url)

      expect(result).to eq([200, valid_json])
    end

    it 'make request for https' do
      stub_request(:get, url).to_return(body: valid_json)

      result = provider.get(url)

      expect(result).to eq([200, valid_json])
    end
  end

  describe '#post' do
    it 'supports post method' do
      stub_request(:post, url).with(body: valid_json).to_return(body: valid_json)

      result = provider.post(url, valid_json)

      expect(result).to eq([200, valid_json])
    end
  end

  describe '#post_form' do
    it 'supports post_form method' do
      stub_request(:post, url).to_return(body: valid_json)

      result = provider.post_form(url, { file: 'one_file' })

      expect(result).to eq([200, valid_json])
    end
  end
end
