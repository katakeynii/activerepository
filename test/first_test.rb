require "minitest/autorun"
# require 'factorybot'
class HolaTest < Minitest::Test
    # include FactoryBot::Syntax::Methods

    def test_english_hello
      assert_equal "hello world", "hello world"
    end
  
    def test_any_hello
      assert_equal "hello world",
        "hello world"
    end
  
    def test_spanish_hello
      assert_equal "hola mundo", "hola mundo"
    end
end