# frozen_string_literal: true

require_relative 'lib/pifano_config/version'

version = PifanoConfig::VERSION

Gem::Specification.new do |spec|
  spec.name = 'pifano_config'
  spec.version = version
  spec.authors = ['Aristóteles Coutinho']
  spec.email = ['aristotelesbr@gmail.com']
  spec.license = 'MIT'

  spec.summary = 'Simple configuration for your project by enviroment.'
  spec.description = <<-DESC
    Create simple configurations for your project by environment like playing a Pífano.
    The Pífano is a traditional musical instrument of the Brazilian Northeast, made of wood and leather. It is a kind of flute, with a sharp and piercing sound. It is used in the forró, a typical dance of the region.
  DESC
  
  spec.homepage = "https://rubygems.org/gems/pifano_config"
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = "https://rubygems.org/gems/pifano_config"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/aristotelesbr/pifano_config'
  spec.metadata['changelog_uri'] = 'https://github.com/aristotelesbr/pifano_config/blob/master/CHANGELOG.md'

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
