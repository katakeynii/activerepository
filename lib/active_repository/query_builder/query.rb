module ActiveRepository
    module QueryBuilder
        class Query
            extend ActiveModel::Callbacks
 
            define_model_callbacks :next, :only => [:before]
            before_next :verify_todos
            def next
                run_callbacks :next do
                  puts "Attention..."
                end
            end

            def verify_todos
                puts "!" * 100
                raise "TODO : #{@todos.join(' - ')}" unless @todos.empty?
            end
            JOIN_TYPES = [:join, 
                :inner_join, 
                :left_outer_join, 
                :right_outer_join, 
                :full_outer_join,
                :left_join,
                :right_join
            ]
            attr_reader :manager, :arel_table, :table_alias, :joins, :todos

            def initialize
              @manager = Arel::SelectManager.new(Arel::Table.engine)
              @todos = []
            end

            def select *args
                args = args.map {|arg| [Symbol, String].include?(arg.class) ? Arel.sql(arg) : arg  }
                @manager.project(args)
                self
            end

            def to_sql
                @manager.to_sql 
            end

            def where where 
                @manager.where where 
                self
            end
            
            def join join_type, to_table

                self
            end
            def from _from, _alias = nil
                _alias ||= _from
                @arel_table = Arel::Table.new(_from)
                @alias_table = @manager.create_table_alias(@arel_table, _alias)
                build_alias _alias
                @manager.from(@alias_table)
                self
            end

            def build_alias _alias
                @alias_table = Arel::Nodes::TableAlias.new(@arel_table, _alias)
                instance_variable_set "@#{_alias}", @alias_table 
                self.class.attr_reader _alias.to_sym
            end

            def function
                query = Arel::Nodes::NamedFunction.new("#{options[:schema]}.api_get_#{method_name}", args_node).to_sql
            end

            # def join join, alias, condition_type, condition 
            # end

            # def inner_join join, alias, condition_type, condition 
            # end

            # def left_join join, alias, condition_type, condition 
            # end

            def and_where where
            end
            
            def orWhere where
            end

            def groupBy groupBy
            end
        
            def addGroupBy groupBy
            end
        
            def having having
            end
        
            def andHaving having
            end
        
            def orHaving having
            end
        
            def orderBy sort, order = nil
            end
        
            def addOrderBy sort, order = nil
            end

        end
    end
end