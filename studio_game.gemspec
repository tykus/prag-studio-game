Gem::Specification.new do |s|
  s.name         = "tykus_studio_game"
  s.version      = "1.0.0"
  s.author       = "Brian O'Sullivan"
  s.email        = "brian@tykus.ie"
  s.homepage     = "https://github.com/tykus/prag-studio-game"
  s.summary      = "Simple Ruby Game"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=2.0'
  s.add_development_dependency 'rspec'
end
