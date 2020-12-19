module ActiveRepository
    module FnCaller
        class Caller

            def initialize
              @unsupported_dbs = [:sqlite3, :mysql] # :sqlite3
              @adapter = ActiveRecord::Base.connection.instance_values["config"][:adapter].to_sym 
              @adapter = :postgresl
              raise "Unsupported call on Dbs : #{@unsupported_dbs.join(' ')}" if @unsupported_dbs.include?(@adapter)
            end

            def method_missing(method_name, schema = "public", *args)
                fn_name = "#{schema}.#{method_name}"
                query = self.class.build_query(fn_name, *args)
                # self.class.exec_query(query)
            rescue ActiveRecord::StatementInvalid => e
                puts e.inspect
            end

            class << self 
                def exec_query query
                    connection = ActiveRecord::Base.connection
                    data = connection.select_all(query)
                    data = data.many? ? data.to_ary : data.to_ary.first
                end

                def build_query method_name, *args
                    args_node = args.map{|arg| Arel::Nodes::Quoted.new(arg)}
                    query = Arel::Nodes::NamedFunction.new(method_name, args_node).to_sql
                    manager = Arel::SelectManager.new(Arel::Table.engine)
                    manager.project('*').from(query).to_sql
                end
            end
            private

        end
    end
end