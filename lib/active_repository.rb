require "active_repository/version"
require "active_repository/aggregate"
module ActiveRepository

  autoload :Aggregate, "active_repository/aggregate"

  module Aggregate
    autoload :Node,        'active_repository/aggregate/node'
    autoload :NodeRegistry,        'active_repository/aggregate/node_registry'
  end

  class Error < StandardError; end
  # Your code goes here...


  include ActiveRepository::Aggregate
  # include ActiveRepository::Aggregate::Node
  # include ActiveRepository::Aggregate::NodeRegistry
end
