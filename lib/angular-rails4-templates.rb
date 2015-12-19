require 'angular-rails4-templates/engine'

module AngularRails4Templates
  autoload :HamlProcessor, 'angular-rails4-templates/haml_processor'
  autoload :Processor, 'angular-rails4-templates/processor'
  autoload :VERSION,  'angular-rails4-templates/version'

  Sprockets.register_mime_type 'text/haml', extensions: ['.haml']
  Sprockets.register_transformer 'text/haml', 'application/javascript', AngularRails4Templates::HamlProcessor
  Sprockets.register_transformer 'text/html', 'application/javascript', AngularRails4Templates::Processor
end
