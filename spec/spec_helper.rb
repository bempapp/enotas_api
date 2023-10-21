# frozen_string_literal: true

require 'simplecov'
require 'simplecov_json_formatter'

require 'bundler/setup'
require 'enotas_api'
require 'webmock/rspec'
require 'json'
require 'bigdecimal'
require 'date'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  # config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Reset configuration for each example to avoid configuration sharing between specs
  config.before do
    Singleton.__init__(EnotasApi::Configuration)
  end
end

SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter.new([
                                                       SimpleCov::Formatter::JSONFormatter,
                                                       SimpleCov::Formatter::HTMLFormatter
                                                     ])
end
