require "active_support"
# require "activesupport/rails"

module ActiveRepository
    module FnCaller
        extend ActiveSupport::Concern
        autoload :Caller, 'active_repository/fn_caller/caller'

        # module ClassMethods
        included do 
            def create_query
                ActiveRepository::QueryBuilder::Query.new
            end
        end
        module ClassMethods
            def fn
                adapter = ActiveRecord::Base.connection.instance_values["config"][:adapter].to_sym
                klass = Caller.new
            end
        end
        
    end
end