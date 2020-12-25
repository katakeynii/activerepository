require "active_repository/query_builder"
require "minitest/autorun"
require 'models/blog/post'
require 'test_helper'

class AggregateTest < ActiveSupport::TestCase

    describe ActiveRepository::QueryBuilder do
        it "must contain at least node" do
            qb = ActiveRepository::QueryBuilder::Query.new
            # dd = qb.from("articles", "a")
            puts qb.from("articles", "ar")
            .select("title", "ar.content")
            .where(
                qb.ar[:title].eq("Bonjour")
            ).to_sql
        end
    end

end