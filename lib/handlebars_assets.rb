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

  if defined?(Rails) && defined?(::Rails::Engine)
    require 'handlebars_assets/engine'
  else
    require 'sprockets'
    Sprockets.register_engine '.hbs', TiltHandlebars
    Sprockets.register_engine '.handlebars', TiltHandlebars
    Sprockets.register_engine('.hamlbars', TiltHandlebars) if HandlebarsAssets::Config.haml_available?
    Sprockets.register_engine('.slimbars', TiltHandlebars) if HandlebarsAssets::Config.slim_available?
  end

  require 'handlebars_assets/railtie'
end
