require 'minitest/autorun'  # the test runner
require 'minitest/pride' 
require 'minitest/spec'
# require 'minitest/autorun'
require 'script'

require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


end