require 'repositories/blog_repository'
require 'models/blog/comment'
require 'models/blog/post'
require "minitest/autorun"

describe ActiveRepository::Aggregate::NodeRegistry do

    before do
        @registry = ActiveRepository::Aggregate::NodeRegistry.new
        @number = 5
      end

    it "Should register a model as a node" do 
        node = @registry.register(:comment, 'Blog::Comment', :blog_repository)

        assert_instance_of ActiveRepository::Aggregate::Item, node
        refute_empty @registry.registrations
    end

    it "should find a repository node" do 
        @registry.register(:post, 'Blog::Post', :blog_repository)
        node = @registry.find(:post, :blog_repository)
        assert_instance_of ActiveRepository::Aggregate::Item, node
    end
end