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
            
            def register(name, target_klass)
                @registry.register(name, target_klass)
            end
        
            def find(node_name) # :nodoc:
                @registry.find(node_name)
            end
        end
    end
    
end