module ActiveRepository
    class Base
        include ActiveRepository::Aggregate

        def initialize
            @repo = self.class
        end
    end
end