# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yt/annotations/version'

Gem::Specification.new do |spec|
  spec.name          = 'yt-annotations'
  spec.version       = Yt::Annotations::VERSION
  spec.authors       = ['claudiob']
  spec.email         = ['claudiob@gmail.com']

  spec.summary       = %q{Fetch annotations and cards from YouTube videos.}
  spec.description   = %q{A Ruby library to retrieve every type of annotation from
    any YouTube video, including branding, featured content and info cards.}
  spec.homepage      = 'https://github.com/fullscreen/yt-annotations'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.2.2'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 4', '< 6'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'coveralls', '~> 0.8.10'
  spec.add_development_dependency 'pry-nav', '~> 0.2.4'
end
