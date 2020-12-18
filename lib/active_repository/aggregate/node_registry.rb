module ActiveRepository
    module Aggregate
      class NodeRegistry
        attr_reader :registrations

        def initialize
            @repository = :all
            @registrations = {}
        end
    
        def register(name, target_klass, repository)
            node = Item.new(name , target_klass )
            registrations[repository] ||= []
            registrations[repository] << node

            node
        end

        def set_repository(repository)
          @repository = repository 
          self
        end

        def find(node_name, repository)
          item = @registrations[repository].find {|r| r.name === node_name.to_sym}
          item.nil? ? nil : item
        end

        def method_missing m, *args, &block 
          repo = @registrations[@repository]
          node = repo.find {|r| r.name === m.to_sym}
          node.nil? ? nil : node.klass
        end
        private
      end

      class Item
        attr_reader :name, :klass 
        def initialize(name, klass)
          @name = name
          @klass = Object.const_get(klass)
          # @klass = klass
        end
        def method_missing(method_name, *args, &block)
          @klass.send(method_name, *args, &block)
        end
      end
    end
end