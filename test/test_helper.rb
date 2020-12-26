require 'minitest/autorun'  # the test runner
require 'minitest/pride' 
require 'minitest/spec'
require "rails"
ENV['RAILS_ENV'] ||= 'test'
require "rails_app/config/environment"
require "rails/test_help"
require 'coveralls'
require 'simplecov'
SimpleCov.start
Coveralls.wear!

# ActiveRecord::Base.legacy_connection_handling = false
# ActiveRecord::Base.establish_connection :test
ActiveSupport::TestCase.fixture_path = "./fixtures"

module TestSetup
    extend ActiveSupport::Concern
  
    included do
      # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    end
end


ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

load File.dirname(__FILE__) + '/schema.rb'

class ActiveSupport::TestCase
    include TestSetup

    # ActiveRecord::Base.establish_connection(
    #     :adapter => "sqlite3",
    #     :database  => "./db/development.sqlite3"
    # )

    # ActiveRecord::Migration.check_pending!

    include ActiveRecord::TestFixtures

    ActiveRecord::FixtureSet.reset_cache
    fixtures_folder = File.join(File.dirname(__FILE__), 'fixtures')
    the_fixtures = Dir[File.join(fixtures_folder, '*.yml')].map {|f| File.basename(f, '.yml') }
    ActiveRecord::FixtureSet.create_fixtures(fixtures_folder, the_fixtures)
    
    # self.fixture_path = File.join(File.dirname(__FILE__), 'fixtures')
    # self.use_instantiated_fixtures = false
    # self.use_transactional_fixtures = true

    fixtures :all

end
