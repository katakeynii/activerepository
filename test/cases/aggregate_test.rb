require 'repositories/blog_repository'
require "minitest/autorun"

describe ActiveRepository::Aggregate do
  before do
    @repo = BlogRepository.new
    @number = 5
  end

  describe "when asked about cheeseburgers" do
    it "must respond positively" do
      _(@number).must_equal 5
    end
  end


end

  