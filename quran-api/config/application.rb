# frozen_string_literal: true

require_relative 'boot'
require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require "sprockets/railtie"

Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module Quranapi
  class Application < Rails::Application
    config.api_only = true
    config.load_defaults(6.0)
    config.generators do |generator|
      generator.test_framework(
        :rspec,
        fixtures: true,
        controller_specs: true,
        routing_specs: true,
        request_specs: true
      )
      generator.fixture_replacement(:factory_bot, dir: 'spec/factories')

      config.api_url = 'http://api.islam.pl/'
    end
  end
end
