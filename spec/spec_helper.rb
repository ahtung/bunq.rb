Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "bunq_rb"

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.order = "random"
end
