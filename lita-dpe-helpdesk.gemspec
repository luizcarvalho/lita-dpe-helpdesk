Gem::Specification.new do |spec|
  spec.name          = 'lita_dpe_helpdesk'
  spec.version       = '0.1.0'
  spec.authors       = ['Luiz Carvalho']
  spec.email         = ['contato@luizcarvalho.com']
  spec.description   = 'Handler to Lita to communicate system Defensoria Pública do Estado do Tocantins Helpdesk System'
  spec.summary       = 'Handler to Defensoria Pública do Tocantins Helpdesk system'
  spec.homepage      = 'http://luizcarvalho.com'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '>= 4.7'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rspec', '>= 3.0.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'pry'
end
