module ActiveRepository
    module Aggregate
        module Node 
            @registry = NodeRegistry.new

            class << self
                attr_accessor :registry
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
    
end