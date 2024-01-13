# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Aristóteles Coutinho.

source 'https://rubygems.org'

# Specify your gem's dependencies in pifano_config.gemspec
gemspec

group :maintenance, optional: true do
	# [https://rubygems.org/gems/bake-gem]
	# Bake Gem is a Bake extension that helps you to create a new Ruby
	# gem.
	gem 'bake-gem'
	# [https://rubygems.org/gems/bake-modernize]
	# Bake Modernize is a Bake extension that helps you to modernize your
	# Ruby code.
	gem 'bake-modernize'
	# [https://rubygems.org/gems/bake-github-pages]
	# Bake Github Pages is a Bake extension that helps you to publish your
	# project documentation to Github Pages.
	gem 'bake-github-pages'
	# [https://rubygems.org/gems/utpia-project]
	# Utopia Project is a Bake extension that helps you to create a new
	# project.
	gem 'utopia-project'
end

group :test do
	# [https://rubygems.org/gems/rubocop]
	# RuboCop is a Ruby code style checking and code formatting tool. It aims to enforce the
	# community-driven Ruby Style Guide.
	gem 'rubocop', '~> 1.59'
	# [https://rubygems.org/gems/covered]
	# Covered is a simple code coverage tool for Ruby.
	gem 'covered', '~> 0.25.1'
	# [https://rubygems.org/gems/bake]
	# Bake is a build tool for Ruby projects. It is designed to be simple,
	# fast and extensible.
	gem 'bake'
	# [https://rubygems.org/gems/minitest]
	# Minitest provides a complete suite of testing facilities supporting
	# TDD, BDD, mocking, and benchmarking.
	gem 'minitest', '~> 5.0'
end
