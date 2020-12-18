require "active_support"
# require "activesupport/rails"

module ActiveRepository
    module Aggregate

        extend ActiveSupport::Concern
        autoload :Nodes, 'active_repository/aggregate/nodes'
        autoload :NodeRegistry, 'active_repository/aggregate/node_registry'
        included do 
        end
        module ClassMethods
            @@nodes = Aggregate::Nodes.new

            def nodes
                repository =  self.name.underscore.to_sym
                @@nodes.set_repository(repository)
                @@nodes.registry
            end
            def aggregate &block
                block.call if block_given?
            end
            def node name, target
                repository =  self.name.underscore.to_sym
                @@nodes.register(name, target, repository)
            end
        end

    end
end