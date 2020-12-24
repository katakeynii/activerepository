module ActiveRepository
    class Base
        include ActiveRepository::Aggregate
        include ActiveRepository::FnCaller

        def initialize
            @repo = self.class
        end

        def find id
            puts ":D" * 50
        end

    end
end