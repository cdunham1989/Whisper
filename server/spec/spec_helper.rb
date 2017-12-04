ENV['RACK_ENV'] = 'test'

require(File.expand_path('../lib/app', File.dirname(__FILE__)))
require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'

Capybara.app = MessageServer

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console
])
SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
