# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Tweet4rent::Application.initialize!

Haml::Template::options[:ugly] = false
