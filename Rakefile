require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'rdoc/task'

require "rake/testtask"


Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = "test/**/*_test.rb"
  t.verbose = true
  t.warning = true
end

task default: :test

desc 'Generate documentation for ActiveRepository.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ActiveRepository'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
# RSpec::Core::RakeTask.new(:spec)

# task :default => :spec
