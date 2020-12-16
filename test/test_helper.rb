require 'minitest/autorun'  # the test runner
require 'minitest/pride' 
require 'minitest/spec'
require "rails"
ENV['RAILS_ENV'] ||= 'test'
require "rails_app/config/environment"
require "rails/test_help"

ActiveRecord::Base.legacy_connection_handling = false
ActiveRecord::Base.establish_connection :test

module TestSetup
    extend ActiveSupport::Concern
  
    included do
      # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
      fixtures :all
    end
end
class ActiveSupport::TestCase
    include TestSetup
end
