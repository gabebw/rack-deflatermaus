$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")

require "rack"
require "rack/deflatermaus"

require "rspec"
require "rack/test"

Dir["spec/support/**/*.rb"].each { |f| require File.expand_path(f) }

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
