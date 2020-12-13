require "bundler/gem_tasks"
require "rspec/core/rake_task"

require "rake/testtask"


Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = "test/**/*_test.rb"
  t.warning = true
end

task default: :test

# RSpec::Core::RakeTask.new(:spec)

# task :default => :spec
