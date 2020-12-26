source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }
# Specify your gem's dependencies in activerepository.gemspec

gem "rails", "~> 6.1.0"

gem "rdoc"
gemspec

gem "responders", "~> 3.0"

group :test do
  gem 'coveralls','~> 0.8' , require: false
  gem "timecop"
  gem "webrat", "0.7.3", require: false
  gem "mocha", "~> 1.1", require: false
  gem 'rubocop', '~> 0.68.1'
  gem 'rubocop-performance'
  gem 'simplecov',  '~> 0.9', require: false
  gem 'simplecov-lcov', require: false
  gem 'shrine', '~> 2.0'
  gem 'shrine-memory'
  gem 'database_cleaner', ['>= 1.2', '!= 1.4.0', '!= 1.5.0']
end

platforms :ruby do
  gem "sqlite3", "~> 1.4"
end

