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
    super(uri: '/test_uri', method: :POST, content: 'request_body')
  end
end

class TestPostFormRequest < EnotasApi::Request
  def initialize
    form_data = { form: 'data' }
    super(uri: '/test_uri', method: :POST_FORM, content: form_data)
  end
end

class TestDeleteRequest < EnotasApi::Request
  def initialize
    super(uri: '/delete_uri', method: :DELETE)
  end
end

RSpec.describe EnotasApi::Request do
  let(:get_request) { TestGetRequest.new }
  let(:post_request) { TestPostRequest.new }
  let(:post_form_request) { TestPostFormRequest.new }
  let(:url) { 'base_url/test_uri?pageNumber=0&pageSize=150' }
  let(:body) { { json: true }.to_json.to_s }

  before do
    EnotasApi::Configuration.configure(api_key: 'test-key', base_url: 'http://base_url')
  end

  describe '#call' do
    it 'make a get request to expected url' do
      stub_request(:get, url).to_return(body:)

      result = get_request.call

      expect(result).to be_truthy
    end

    it 'retrieve a result object' do
      stub_request(:get, url).to_return(body:)

      result = get_request.call

      expect(result.class).to eq(EnotasApi::JsonResult)
      expect(result.json).to be true
    end

    it 'allow to customize result object' do
      allow(get_request).to receive(:result_object).and_return(EnotasApi::RawResult)

      stub_request(:get, url).to_return(body:)

      result = get_request.call

      expect(result.class).to eq(EnotasApi::RawResult)
    end

    it 'suports post request' do
      stub_request(:post, url).with(body: /request_body/).to_return(body:)

      result = post_request.call

      expect(result).to be_truthy
      expect(result.json).to be true
    end

    it 'supports post_form request' do
      stub_request(:post, 'base_url/test_uri')
        .with(headers: { 'Content-Type' => 'multipart/form-data' })
        .to_return(body:)

      result = post_form_request.call

      expect(result).to be_truthy
      expect(result.json).to be true
    end

    it 'supports delete request' do
      stub_request(:delete, 'base_url/delete_uri').to_return(body:)

      result = TestDeleteRequest.new.call

      expect(result).to be_truthy
      expect(result.json).to be true
    end
  end

  describe '#call!' do
    it 'retrieve a result object when success' do
      stub_request(:get, url).to_return(body:)

      result = get_request.call!

      expect(result.success?).to be true
    end

    it 'throw an error when failed' do
      stub_request(:get, url).to_return(status: 400, body:)

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

  describe '#to_json' do
    it 'retrieve nil json' do
      expect(get_request.to_json).to be_nil
    end

    it 'retrieve content json' do
      expect(post_request.to_json).to eq('request_body')
    end

    it 'retrieve form_data json' do
      expect(post_form_request.to_json).to eq('{"form":"data"}')
    end
  end
end
