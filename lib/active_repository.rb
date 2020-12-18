# require 'rails'
$:.push File.expand_path("../lib", __FILE__)
require 'active_support/core_ext/numeric/time'
require 'active_support/dependencies'
require "active_repository/version"
require "active_repository/aggregate"

module ActiveRepository

  autoload :Aggregate, "active_repository/aggregate"
  autoload :Base ,     "active_repository/base"
  
  module Aggregate
    autoload :Nodes,           'active_repository/aggregate/nodes'
    autoload :NodeRegistry,    'active_repository/aggregate/node_registry'
  end

  class Error < StandardError; end
  # Your code goes here...


  include ActiveRepository::Aggregate

end
