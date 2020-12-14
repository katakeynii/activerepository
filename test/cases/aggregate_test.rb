require 'repositories/blog_repository'
require "minitest/autorun"

describe ActiveRepository::Aggregate do
  before do
    @repo = BlogRepository.new
    @number = 5
  end

  describe "When adding new Repository" do

    it "must contain at least node" do
      _(BlogRepository.nodes.empty?).must_equal false 
    end

    it "must have a nodes method" do 
      _(BlogRepository.respond_to?(:nodes)).must_equal true
    end

    it "must have an aggregate method" do 
      _(BlogRepository.respond_to?(:aggregate)).must_equal true
    end

    it "should return node item on node method" do 
      _(BlogRepository.respond_to?(:node)).must_equal true
      assert_instance_of ActiveRepository::Aggregate::Item, BlogRepository.node(:alpha, "Blog::Comment")
    end

  end
end

  