require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module H4baguio
  class Application < Rails::Application
    config.autoload_paths << config.root.join('lib')
    config.assets.precompile = [/^(.+\/)?[^_][.a-zA-Z\d_-]*\.(js|coffee|png|gif
                                                              |jpg|swf|css|scss
                                                              |erb|html
                                                              |ico|woff|svg
                                                              |eot|ttf)+$/]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{yml}')]
  end
end

Rails.application.config.generators do |g|
  g.test_framework :rspec, view_specs: false,
    request_specs: false,
    routing_specs: false
end
