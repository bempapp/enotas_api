# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

desc 'Run Rubocop'
task :rubocop do
  sh 'rubocop . --auto-correct'
end

desc 'Run All Resources Check'
task :check do
  %w[rubocop spec].each do |task|
    Rake::Task[task].execute
  end
end

task default: :check
