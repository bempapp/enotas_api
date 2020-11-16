# frozen_string_literal: true

require 'singleton'
require 'logger'
require_relative 'request_provider'

module EnotasApi
  class Configuration
    include Singleton

    NO_CONFIGURATION_ERROR = 'It\'s necessary to configure EnotasApi before to call any API method \n' \
                             'Please configure using EnotasApi::Configuration.configure(api_key: \'your api key\')'

    attr_reader :configured, :api_key, :request_provider, :base_url, :logger

    def self.configure(**kwargs)
      instance.configure(kwargs)
    end

    def self.current
      raise EnotasApi::Error, NO_CONFIGURATION_ERROR unless instance.configured

      instance
    end

    def configure(
      api_key:,
      request_provider: RequestProvider.new,
      base_url: 'https://api.enotasgw.com.br',
      logger: default_logger
    )
      @configured = true
      @api_key = api_key
      @request_provider = request_provider
      @base_url = base_url
      @logger = logger
    end

    def default_logger
      logger = Logger.new($stdout)
      logger.formatter = proc do |severity, datetime, _progname, msg|
        "#{datetime} #{severity}: #{msg}\n"
      end
      logger
    end
  end
end
