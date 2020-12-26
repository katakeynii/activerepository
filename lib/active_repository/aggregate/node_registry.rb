module ActiveRepository
    module Aggregate
      class NodeRegistry
        attr_reader :registrations

        def initialize
            @repository = :all
            @registrations = {}
        end
        
        def has_root_item? 
          registrations[repository]
        end

        def register(name, target_klass, root, repository)
            node = Item.new(name , target_klass, root )
            registrations[repository] ||= []
            if root.eql?(true)
              root_item = find_root repository

              raise MultipleRootError if !root_item.nil? && !root_item.name.eql?(name)
            end
            _node = find(name, repository)
            registrations[repository] << node if _node.nil?

            node
        end

        def set_repository(repository)
          @repository = repository 
          self
        end

        def find_root repository
          item = @registrations[repository].find {|r| r.root === true}   
          item.nil? ? nil : item.klass  
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

    end
end