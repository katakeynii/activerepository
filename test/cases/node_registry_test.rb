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
        node = @registry.register(:comment, 'Blog::Comment', false, :blog_repository)

        assert_instance_of ActiveRepository::Aggregate::Item, node
        refute_empty @registry.registrations
    end

    it "should find a repository node" do 
        @registry.register(:post, 'Blog::Post', false,  :blog_repository)
        node = @registry.find(:post, :blog_repository)
        assert_instance_of ActiveRepository::Aggregate::Item, node
    end

    it "should not register two root model" do
        assert_raises  ActiveRepository::MultipleRootError do 
            @registry.register(:post, 'Blog::Post', true,  :blog_repository)
            @registry.register(:comment, 'Blog::Comment', true,  :blog_repository)
        end
    end
end