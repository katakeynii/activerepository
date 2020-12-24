module ActiveRepository
    module Aggregate 
        class Nodes
            attr_accessor :registry
            
            def initialize()
                @registry = NodeRegistry.new
            end

            def all
                @registry.registrations
            end

            def set_repository(repository)
                @registry.set_repository(repository)
            end

            def find_root repository
                @registry.find_root(repository)
            end

            def register(name, target_klass, root, repository)
                @registry.register(name, target_klass, root, repository)
            end
        
            def find(node_name, repository) # :nodoc:
                @registry.find(node_name, repository)
            end
        end
    end
    
end