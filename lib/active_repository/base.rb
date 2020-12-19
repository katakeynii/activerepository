module ActiveRepository
    class Base
        include ActiveRepository::Aggregate
        include ActiveRepository::FnCaller

        def initialize
            @repo = self.class
        end
    end
end