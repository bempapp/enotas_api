# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new

desc 'Run All Resources Check'
task :check do
  %w[rubocop:autocorrect spec].each do |task|
    Rake::Task[task].execute
  end
end

task default: :check
