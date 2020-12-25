module ActiveRepository
    module Aggregate
        class Item
            attr_reader :name, :klass ,:root
            def initialize(name, klass, root)
              @name = name
              @root = root
              @klass = Object.const_get(klass)
              # @klass = klass
            end
            def method_missing(method_name, *args, &block)
              @klass.send(method_name, *args, &block)
            end
          end
    end
end