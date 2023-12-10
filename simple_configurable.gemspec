# frozen_string_literal: true

require_relative 'lib/simple_configurable/version'

version = SimpleConfigurable::VERSION

Gem::Specification.new do |spec|
  spec.name = 'simple_configurable'
  spec.version = version
  spec.authors = ['Aristóteles Coutinho']
  spec.email = ['aristotelesbr@gmail.com']
  spec.license = 'MIT'

  spec.summary = 'Simple configuration for your project by enviroment.'
  spec.description = <<-DESC
    Create a simple easy configuration for your project by enviroment.
  DESC
  
  spec.homepage = "https://rubygems.org/gems/simple_configurable-#{version}"
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = "https://rubygems.org/gems/simple_configurable-#{version}"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/aristotelesbr/simple_configurable'
  spec.metadata['changelog_uri'] = 'https://github.com/aristotelesbr/simple_configurable/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir['lib/**/*',
                   'exe/**/*',
                   'LICENSE.txt',
                   'README.md',
                   'CHANGELOG.md']
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
