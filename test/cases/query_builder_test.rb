require "active_repository/query_builder"
require "minitest/autorun"
require 'models/blog/post'
require 'test_helper'

class AggregateTest < ActiveSupport::TestCase

    describe ActiveRepository::QueryBuilder do
        it "must contain at least node" do
            qb = ActiveRepository::QueryBuilder::Query.new
            qb2 = ActiveRepository::QueryBuilder::Query.new

            # puts qb2.fn("generate_series", "date '2020-11-01 00:00'", "date '2020-11-30 00:00'",  "'1 day'::interval").get_result
        end
    end

end