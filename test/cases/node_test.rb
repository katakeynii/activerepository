
require "minitest/autorun"

class NodeTest < ActiveSupport::TestCase

    describe "Node Behaviors" do 
        it "should respond to basic methods " do 
            assert_equal true, ActiveRepository::Aggregate::Node.respond_to?(:registry)
            assert_equal true, ActiveRepository::Aggregate::Node.respond_to?(:find)
            assert_equal true, ActiveRepository::Aggregate::Node.respond_to?(:register)
            assert_equal true, ActiveRepository::Aggregate::Node.respond_to?(:all)
        end
        it "should add and return a node item" do 
            item = ActiveRepository::Aggregate::Node.register(:article, 'Blog::Post' )
            assert_instance_of ActiveRepository::Aggregate::Item, item
        end
        it "should find a registred node" do 
            ActiveRepository::Aggregate::Node.register(:article, 'Blog::Post' )
            item = ActiveRepository::Aggregate::Node.find(:article )
            assert_instance_of ActiveRepository::Aggregate::Item, item
        end
        it "should return list of all registred node" do 
            ActiveRepository::Aggregate::Node.register(:article, 'Blog::Post' )
            ActiveRepository::Aggregate::Node.register(:user, 'Blog::User' )
            nodes = ActiveRepository::Aggregate::Node.all
            assert_instance_of Array, nodes
            refute_empty nodes
        end

        it "should return an NodeRegistry instance" do 
            @registry = ActiveRepository::Aggregate::Node.registry
            assert_instance_of ActiveRepository::Aggregate::NodeRegistry, @registry
        end

    end
end