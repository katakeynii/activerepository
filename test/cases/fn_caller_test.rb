require 'repositories/blog_repository'
require 'repositories/group_repository'
require "minitest/autorun"
require 'models/blog/post'
require 'test_helper'

class AggregateTest < ActiveSupport::TestCase

    describe ActiveRepository::FnCaller do
        it "must contain at least node" do
            puts "=" * 100
            puts BlogRepository.fn.api_get_distance( 1, 2, 3)
        end
    end

end