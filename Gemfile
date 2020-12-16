source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }
# Specify your gem's dependencies in activerepository.gemspec

gem "rails", "~> 6.1.0"

gem "rdoc"
gemspec

gem "responders", "~> 3.0"

group :test do
  gem "timecop"
  gem "webrat", "0.7.3", require: false
  gem "mocha", "~> 1.1", require: false
end

platforms :ruby do
  gem "sqlite3", "~> 1.4"
end