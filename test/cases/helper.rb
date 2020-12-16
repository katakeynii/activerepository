require "config"

require "stringio"

require "active_record"
require "cases/test_case"
require "active_support/dependencies"
require "active_support/logger"
require "active_support/core_ext/kernel/singleton_class"

require "support/config"
require "support/connection"

# TODO: Move all these random hacks into the ARTest namespace and into the support/ dir

Thread.abort_on_exception = true

# Show backtraces for deprecated behavior for quicker cleanup.
ActiveSupport::Deprecation.debug = true