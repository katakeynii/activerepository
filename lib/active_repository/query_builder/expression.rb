module ActiveRepository
    module QueryBuilder
        class Expression
            
            def and other
                Arel::Nodes::And.new(other)
            end
        end
    end
end