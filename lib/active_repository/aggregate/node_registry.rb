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
        end

        def find(node_name)
            registration = registration.find {|r| r.name === node_name}
            raise ArgumentError, "We dont know this node !" if registration.nil?
        end

        private
      end

      class Item
        attr_reader :name, :klass 
        def initialize(name, klass)
          @name = name
          # @klass = Object.const_get(klass)
          @klass = klass
        end
        def method_missing(method_name, *args, &block)
          @klass.send(method_name, *args, &block)
        end
      end
    end
end