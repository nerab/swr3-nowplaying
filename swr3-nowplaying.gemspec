# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swr3-nowplaying/version'

Gem::Specification.new do |gem|
  gem.name          = "swr3-nowplaying"
  gem.version       = SWR3::NowPlaying::VERSION
  gem.authors       = ["Nicholas E. Rabenau"]
  gem.email         = ["nerab@gmx.net"]
  gem.description   = %q{The German radio station "SWR3" provides details about the currently playing song. This gem parses the feed and provides the details as Ruby object.}
  gem.summary       = %q{Provides the track that is currently playing in SWR3}
  gem.homepage      = "http://github.com/nerab/#{gem.name}"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'minitest'

  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-minitest'
  gem.add_development_dependency 'guard-bundler'
  gem.add_development_dependency 'terminal-notifier-guard'
  gem.add_development_dependency 'rb-inotify', '~> 0.8.8'
  gem.add_development_dependency 'libnotify'
  gem.add_development_dependency 'rb-fsevent'

  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-stack_explorer'
end
