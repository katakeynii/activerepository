# require 'rails'
$:.push File.expand_path("../lib", __FILE__)
require 'active_support/core_ext/numeric/time'
require 'active_support/dependencies'
require "active_repository/version"
require "active_repository/aggregate"

module ActiveRepository

  autoload :Aggregate, "active_repository/aggregate"
  autoload :FnCaller, "active_repository/fn_caller"
  autoload :Base ,     "active_repository/base"
  autoload :Error ,     "active_repository/error"



  module Aggregate
    autoload :Nodes,           'active_repository/aggregate/nodes'
    autoload :NodeRegistry,    'active_repository/aggregate/node_registry'
  end

  module QueryBuilder
  end
  module FnCaller 
    autoload :PostgresFn, 'active_repository/fn_caller/postgres_fn'
  end

  class Error < StandardError; end
  # Your code goes here...


  include ActiveRepository::Aggregate
  include ActiveRepository::FnCaller

end
