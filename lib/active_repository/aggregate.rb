require "active_support"
# require "activesupport/rails"

module ActiveRepository
    module Aggregate

        extend ActiveSupport::Concern
        autoload :Nodes, 'active_repository/aggregate/nodes'
        autoload :Item, 'active_repository/aggregate/item'
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

            def root
                repository =  self.name.underscore.to_sym
                @@nodes.find_root(repository) 
            end

            def node name, target, root: false
                repository =  self.name.underscore.to_sym
                @@nodes.register(name, target, root, repository)
            end

            def model name, target, root: false
                repository =  self.name.underscore.to_sym
                @@nodes.register(name, target, root, repository)
            end

            def method_missing(method_name, *args, &block)
                raise NoRootError if root.nil?
                root.send(method_name, *args, &block)
            end

        end

    end
end