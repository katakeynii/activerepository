require "active_support"
# require "activesupport/rails"

module ActiveRepository
    module Aggregate

        extend ActiveSupport::Concern
        @@nodes = Aggregate::Nodes.new

        module ClassMethods

            def nodes
                # @@nodes.registry
            end
            def aggregate &block
                block.call if block_given?
            end
            def node name, target
                # @@nodes.register(name, target)
            end
        end

    end
end