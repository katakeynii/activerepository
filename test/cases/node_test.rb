
require "minitest/autorun"

class NodeTest < ActiveSupport::TestCase

    describe "Node Behaviors" do 
        it "should respond to basic methods " do 
            assert_equal true, ActiveRepository::Aggregate::Nodes.new.respond_to?(:registry)
            assert_equal true, ActiveRepository::Aggregate::Nodes.new.respond_to?(:find)
            assert_equal true, ActiveRepository::Aggregate::Nodes.new.respond_to?(:register)
            assert_equal true, ActiveRepository::Aggregate::Nodes.new.respond_to?(:all)
        end
        it "should add and return a node item" do 
            item = ActiveRepository::Aggregate::Nodes.new.register(:article, 'Blog::Post', :blog_repository )
            assert_instance_of ActiveRepository::Aggregate::Item, item
        end
        it "should find a registred node" do 
            nodes = ActiveRepository::Aggregate::Nodes.new
            nodes.register(:article, 'Blog::Post', :blog_repository )
            item = nodes.find(:article, :blog_repository )
            assert_instance_of ActiveRepository::Aggregate::Item, item
        end
        it "should return list of all registred node" do 
            nodes = ActiveRepository::Aggregate::Nodes.new
            nodes.register(:article, 'Blog::Post', :blog_repository )
            nodes.register(:user, 'Blog::User', :blog_repository     )
            assert_instance_of Hash, nodes.all
            refute_empty nodes.all[:blog_repository]
        end

        it "should return an NodeRegistry instance" do 
            @registry = ActiveRepository::Aggregate::Nodes.new.registry
            assert_instance_of ActiveRepository::Aggregate::NodeRegistry, @registry
        end

    end
end