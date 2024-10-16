ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'spec_helper'

# Add FactoryBot methods to make it easier to use in specs
require 'devise'
require 'rails/all'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  # Configuring Devise test helpers
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :request

  # DatabaseCleaner setup to clean between tests
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :request) do
    DatabaseCleaner.strategy = :truncation
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Remove transactional fixtures as it's deprecated
  # config.use_transactional_fixtures = true

  # Recommended configurations for better performance
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!

  config.default_formatter = 'doc' if config.files_to_run.one?
  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed

  # Other general RSpec configurations
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # Shared context metadata behavior
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
