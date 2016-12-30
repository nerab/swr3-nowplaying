# frozen_string_literal: true
require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rake/testtask'

Rake::TestTask.new do |test|
  test.libs << 'lib' << 'test' << 'test/unit'
  test.pattern = 'test/unit/test_*.rb'
end

RuboCop::RakeTask.new

task default: :test
