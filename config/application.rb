require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Tweet4rent
  class Application < Rails::Application
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :haml
    end

    config.encoding = "utf-8"

    config.filter_parameters += [:password, :password_confirmation]

  end
end
