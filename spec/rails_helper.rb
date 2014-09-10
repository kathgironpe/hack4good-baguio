ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
%w(
  coveralls
  factory_girl
  pundit/rspec
  rspec/rails
).each do |d|
  require d
end

Coveralls.wear!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.include ControllerHelpers, type: :controller
  config.include Devise::TestHelpers, type: :controller
  config.include FactoryGirl::Syntax::Methods
  config.include Warden::Test::Helpers

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  Warden.test_mode!

  config.infer_spec_type_from_file_location!
  config.include Features::SessionHelpers, type: :feature
  config.include Rails.application.routes.url_helpers
end
