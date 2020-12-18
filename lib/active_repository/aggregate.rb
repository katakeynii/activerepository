require "active_support"
# require "activesupport/rails"

module ActiveRepository
    module Aggregate

        extend ActiveSupport::Concern
        autoload :Node, 'node'
        included do
            # class_attribute :attribute_types
            # self.attribute_types = Hash.new(Type.default_value)
 
        end
        module ClassMethods
            @@node = ActiveRepository::Aggregate::Nodes.new
            def nodes
                @@node.registry
            end
            def aggregate &block
                block.call if block_given?
            end
            def node name, target
                @@node.register(name, target)
            end
        end

    end
end