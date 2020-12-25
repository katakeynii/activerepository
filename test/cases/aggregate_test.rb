require 'repositories/blog_repository'
require 'repositories/group_repository'
require "minitest/autorun"
require 'models/blog/post'
require 'models/blog/group'
require 'test_helper'

class AggregateTest < ActiveSupport::TestCase
  fixtures :posts
  describe ActiveRepository::Aggregate do

    before do
      @repo = BlogRepository.new
      @group_repo = GroupRepository.new
      @number = 5
    end

    describe "When adding new Repository" do

      it "must contain at least node" do
        _(BlogRepository.nodes.registrations.empty?).must_equal false 
      end

      it "must have a nodes method" do 
        _(BlogRepository.respond_to?(:nodes)).must_equal true
      end

      it "must have an aggregate method" do 
        _(BlogRepository.respond_to?(:aggregate)).must_equal true
      end

      it "should add & return node item on node method" do 
        _(BlogRepository.respond_to?(:node)).must_equal true
        assert_instance_of ActiveRepository::Aggregate::Item, BlogRepository.node(:alpha, "Blog::Comment", root: false)
      end

      it "should return node model instance" do 
        assert_equal "Blog::Post", BlogRepository.nodes.post.to_s
      end
      it "should load node from other repo" do 
        refute_equal "Blog::Post", GroupRepository.nodes.post.to_s
      end
      it "should return number of posts" do 
        # assert_equal 2, posts(:welcome)
        # puts Blog::Post.first
        # puts posts
      end

      it "should query direct from root model" do 
        assert_instance_of Blog::Group, GroupRepository.find(1)
      end

      it "should raise error on none root repository" do 
        assert_raises ActiveRepository::NoRootError do 
          BlogRepository.find(1)
        end
      end
    end
  end
end


  