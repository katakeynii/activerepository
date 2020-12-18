module ActiveRepository
    module Aggregate
      class NodeRegistry
        attr_reader :registrations

        def initialize
            @registrations = []
        end
    
        def register(name, target_klass)
            node = Item.new(name , target_klass )
            registrations << node

            node
        end

        def find(node_name)
          item = @registrations.find {|r| r.name === node_name.to_sym}
          item.nil? ? nil : item
        end

        def method_missing m, *args, &block
          node = @registrations.find {|r| r.name === m.to_sym}
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