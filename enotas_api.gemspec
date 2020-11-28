# frozen_string_literal: true

require_relative 'lib/enotas_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'enotas_api'
  spec.version       = EnotasApi::VERSION
  spec.authors       = ['Eduardo Bohrer']
  spec.email         = ['eduardo@salaozen.com.br']

  spec.summary       = 'E-notas API client'
  spec.description   = 'Non oficial, well supported, e-notas ruby api client'
  spec.homepage      = 'https://github.com/salaozen/enotas_api'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('~> 2.6')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rubocop', '~> 1.3'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.0'
  spec.add_development_dependency 'webmock', '~> 3.10'
end
