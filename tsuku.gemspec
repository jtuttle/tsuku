require File.expand_path('../lib/tsuku/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name             = 'tsuku'
  spec.version          = Tsuku::VERSION
  spec.authors          = ['John Tuttle']
  spec.email            = ['jtuttle.develops@gmail.com']

  spec.summary          = 'A tweening library made with Ruby'
  spec.description      = 'A tweening library made with Ruby'
  spec.homepage         = 'https://github.com/jtuttle/tsuku'
  spec.license          = 'MIT'

  spec.files            = `git ls-files -z`.split("\0")
  spec.test_files       = `git ls-files -z spec/`.split("\0")
  spec.extra_rdoc_files = ['README.md', 'CHANGELOG.md']
  spec.require_paths    = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry-byebug', '~> 3.5.0'
end
