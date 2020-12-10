require "active_support"
require "active_support/rails"

module ActiveRepository
    module Aggregate

        extend ActiveSupport::Concern
        autoload :Node, 'node'
        included do
            # class_attribute :attribute_types
            # self.attribute_types = Hash.new(Type.default_value)
 
        end
        module ClassMethods
            def nodes
                Aggregate::Node.all
            end
            def aggregate &block
                block.call if block_given?
            end
            def node name, target
                Aggregate::Node.register(name, target)
            end
        end

    end
end