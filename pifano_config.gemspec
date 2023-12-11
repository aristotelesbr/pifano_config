# frozen_string_literal: true

require_relative "lib/pifano_config/version"

Gem::Specification.new do |spec|
	spec.name = "pifano_config"
	spec.version = PifanoConfig::VERSION
	
	spec.summary = "Simple configuration for your project by enviroment."
	spec.authors = ["Aristóteles Coutinho"]
	spec.license = "MIT"
	
	spec.homepage = "https://rubygems.org/gems/pifano_config"
	
	spec.metadata = {
		"allowed_push_host" => "https://rubygems.org/gems/pifano_config",
		"changelog_uri" => "https://github.com/aristotelesbr/pifano_config/blob/master/CHANGELOG.md",
		"homepage_uri" => "https://rubygems.org/gems/pifano_config",
		"rubygems_mfa_required" => "true",
		"source_code_uri" => "https://github.com/aristotelesbr/pifano_config",
	}
	
	spec.files = Dir['{lib}/**/*', '*.md', base: __dir__]
	
	spec.required_ruby_version = ">= 3.0"
end
