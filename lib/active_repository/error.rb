module ActiveRepository
    class MultipleRootError < StandardError
        def initialize(msg="Cannot have more than one root model")
          super
        end
    end

    class NoRootError < StandardError
        def initialize(msg="This repo doesnt not have root model")
          super
        end
    end

end