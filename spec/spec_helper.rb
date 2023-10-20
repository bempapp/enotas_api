# frozen_string_literal: true

require 'bundler/setup'
require 'enotas_api'
require 'webmock/rspec'
require 'json'
require 'bigdecimal'
require 'date'
require 'simplecov'
# require 'simplecov-lcov'

#SimpleCov::Formatter::LcovFormatter.config do |c|
#  c.output_directory = 'coverage'
#  c.lcov_file_name = 'lcov.info'
#  c.report_with_single_file = true
#end

SimpleCov.start

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
