# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rake/testtask'

namespace :test do
  desc 'Run all specs'
  task all: ['rubocop:auto_correct', :unit, :integration, :system]

  desc 'Run ci'
  task ci: %i[rubocop unit integration system]

  Rake::TestTask.new('unit') do |test|
    test.libs << 'lib' << 'test' << 'test/unit'
    test.pattern = 'test/unit/test_*.rb'
  end

  Rake::TestTask.new('integration') do |test|
    test.libs << 'lib' << 'test'
    test.pattern = 'test/integration/test_*.rb'
  end

  Rake::TestTask.new('system') do |test|
    test.libs << 'lib' << 'test'
    test.pattern = 'test/system/test_*.rb'
  end
end

RuboCop::RakeTask.new

task default: 'test:all'
