# frozen_string_literal: true
require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rake/testtask'

namespace :test do
  desc 'Run all specs'
  task all: ['rubocop:auto_correct', :unit, :integration]

  desc 'Run ci'
  task ci: [:rubocop, :unit, :integration]

  Rake::TestTask.new('unit') do |test|
    test.libs << 'lib' << 'test' << 'test/unit'
    test.pattern = 'test/unit/test_*.rb'
  end

  Rake::TestTask.new('integration') do |test|
    test.libs << 'lib' << 'test'
    test.pattern = 'test/integration/test_*.rb'
  end
end

RuboCop::RakeTask.new

task default: 'test:all'
