# frozen_string_literal: true

require 'spec_helper'

class TestGetRequest < EnotasApi::Request
  paginable
  filterable :field1, :contains
  searchable [:field1]
  sortable [:field1]

  def initialize
    super(uri: '/test_uri')
  end
end

class TestPostRequest < EnotasApi::Request
  paginable
  filterable :field1, :contains
  searchable [:field1]
  sortable [:field1]

  def initialize
    super(uri: '/test_uri', method: :POST, body: 'request_body')
  end
end

class CustomResult
  def initialize(_code, _body); end
end

RSpec.describe EnotasApi::Request do
  let(:get_request) { TestGetRequest.new }
  let(:post_request) { TestPostRequest.new }
  let(:url) { 'base_url/test_uri?pageNumber=0&pageSize=150' }
  let(:body) { { json: true }.to_json.to_s }

  before do
    EnotasApi::Configuration.configure(api_key: 'test-key', base_url: 'http://base_url')
  end

  describe '#call' do
    it 'make a get request to expected url' do
      stub_request(:get, url).to_return(body: body)

      result = get_request.call

      expect(result).to be_truthy
    end

    it 'retrieve a Result object' do
      stub_request(:get, url).to_return(body: body)

      result = get_request.call

      expect(result.class).to eq(EnotasApi::Result)
      expect(result.json).to be true
    end

    it 'allow to customize result object' do
      allow(get_request).to receive(:result_object).and_return(CustomResult)

      stub_request(:get, url).to_return(body: body)

      result = get_request.call

      expect(result.class).to eq(CustomResult)
    end

    it 'suports post request' do
      stub_request(:post, url).with(body: /request_body/).to_return(body: body)

      result = post_request.call

      expect(result).to be_truthy
      expect(result.json).to be true
    end
  end

  describe '#call!' do
    it 'retrieve a result object when success' do
      stub_request(:get, url).to_return(body: body)

      result = get_request.call!

      expect(result.success?).to be true
    end

    it 'throw an error when failed' do
      stub_request(:get, url).to_return(status: 400, body: body)

      expect { get_request.call! }.to raise_error(EnotasApi::Error)
    end
  end

  describe '#to_url' do
    it 'concatenates base_url and uri' do
      expect(get_request.to_url).to eq("http://#{url}")
    end

    it 'concatenates parameters to query string' do
      get_request.param('PARAM1', 'TEST?')
      get_request.param('PARAM2', 'TEST&')

      expect(get_request.to_url).to eq("http://#{url}&PARAM1=TEST%3F&PARAM2=TEST%26")
    end
  end

  describe '#param' do
    it 'allow custom params' do
      get_request.param('ANY', 'VALUE')

      expect(get_request.to_url).to eq("http://#{url}&ANY=VALUE")
    end
  end

  describe 'support modules' do
    it 'allow filters' do
      expect(get_request.respond_to?(:field1_contains)).to be true
    end

    it 'allow sorting' do
      expect(get_request.respond_to?(:sort)).to be true
      expect(get_request.respond_to?(:sort_by_field1)).to be true
    end

    it 'allow paging' do
      expect(get_request.respond_to?(:page)).to be true
    end

    it 'allow searching' do
      expect(get_request.respond_to?(:search)).to be true
      expect(get_request.respond_to?(:search_by_field1)).to be true
    end
  end
end
