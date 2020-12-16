require 'minitest/autorun'  # the test runner
require 'minitest/pride' 
require 'minitest/spec'
# require 'minitest/autorun'
require 'script'

require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

require "rails_app/config/environment"
require "rails/test_help"


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

class Minitest::Test
    include TestSetup
end