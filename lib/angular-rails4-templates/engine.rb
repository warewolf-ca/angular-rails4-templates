module AngularRails4Templates
  class Engine < ::Rails::Engine
    config.angular_templates = ActiveSupport::OrderedOptions.new
    config.angular_templates.module_name    = 'templates'
    config.angular_templates.ignore_prefix  = ['templates/']

    initializer 'angular-rails-templates', group: :all  do |app|
      app.config.assets.register_mime_type 'text/haml', extensions: ['.haml']
      app.config.assets.register_transformer 'text/haml', 'application/javascript', AngularRails4Templates::HamlProcessor
      app.config.assets.register_transformer 'text/html', 'application/javascript', AngularRails4Templates::Processor

      # Sprockets Cache Busting
      # If ART's version or settings change, expire and recompile all assets
      app.config.assets.version = [
        app.config.assets.version,
        'ART',
        Digest::MD5.hexdigest("#{VERSION}-#{app.config.angular_templates}")
      ].join '-'
    end

    config.after_initialize do |app|
      # Ensure ignore_prefix can be passed as a String or Array
      if app.config.angular_templates.ignore_prefix.is_a? String
        app.config.angular_templates.ignore_prefix = Array(app.config.angular_templates.ignore_prefix)
      end
    end
  end
end
