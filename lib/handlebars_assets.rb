require "handlebars_assets/version"
require 'rails'
require 'sprockets'
begin
  require 'sprockets/railtie'
rescue LoadError
  require 'sprockets/rails/railtie'
end

module HandlebarsAssets
  PATH = File.expand_path("../../vendor/assets/javascripts", __FILE__)

  def self.path
    PATH
  end

  autoload(:Config, 'handlebars_assets/config')
  autoload(:Handlebars, 'handlebars_assets/handlebars')
  autoload(:TiltHandlebars, 'handlebars_assets/tilt_handlebars')

  require 'handlebars_assets/railtie'
end
