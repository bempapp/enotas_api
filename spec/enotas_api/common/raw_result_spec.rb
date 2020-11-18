# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::RawResult do
  describe 'status code' do
    let(:content) { 'content' }

    it 'recognize 200 range as success' do
      instance = described_class.new(200, content)

      expect(instance.success?).to be true
      expect(instance.error?).to be false
    end

    it 'recognize range 300 as error' do
      instance = described_class.new(300, content)

      expect(instance.success?).to be false
      expect(instance.error?).to be true
    end

    it 'recognize range 400 as error' do
      instance = described_class.new(400, content)

      expect(instance.success?).to be false
      expect(instance.error?).to be true
    end

    it 'recognize range 500 as error' do
      instance = described_class.new(500, content)

      expect(instance.success?).to be false
      expect(instance.error?).to be true
    end
  end

  describe 'content' do
    it 'retrieve content as string' do
      content = 'content'

      instance = described_class.new(200, content)

      expect(instance.content).to eq(content)
    end

    it 'retrieve content byte array' do
      content = 'content'.bytes

      instance = described_class.new(200, content)

      expect(instance.content).to eq(content)
    end
  end
end
