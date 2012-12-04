$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "integra_engine_detector/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "integra_engine_detector"
  s.version     = IntegraEngineDetector::VERSION
  s.authors     = ["Renato de Souza"]
  s.email       = ["renato.souza@ifb.edu.br"]
  s.homepage    = "http://www.ifb.edu.br"
  s.summary     = "Detector de Engines Integra"
  s.description = "Este detector cria um array com todas as engines Integra encontradas na aplicação"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.7"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
