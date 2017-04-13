# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rake/testtask'

namespace :test do
  desc 'Run all tests'
  task all: ['rubocop:auto_correct', :unit, :integration, :system]

  desc 'Run CI tests'
  task ci: %i[rubocop unit integration system]

  %w[unit integration system].each do |type|
    Rake::TestTask.new(type) do |test|
      test.libs << 'lib' << 'test'
      test.pattern = "test/#{type}/test_*.rb"
    end
  end
end

RuboCop::RakeTask.new

task default: 'test:all'
