# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Aristóteles Coutinho.

require 'test_helper'

module Pifano
	class TestConfig < Minitest::Test
		include Pifano

		def setup
			@config = Pifano::Config.new
		end

		def test_on_raise_error_without_block
			assert_raises(ArgumentError) { @config.on(:dev) }
		end

		def test_on_executes_block
			@config.on(:dev) { |config| config[:foo] = 'bar' }

			assert_equal ({ foo: 'bar' }), @config.environment(:dev)
		end

		def test_on_sets_and_resets_env
			env_value = 'piaui'

			@config.on(env_value) do |config|
				assert_equal env_value, config.instance_variable_get(:@env)
			end

			assert_nil @config.instance_variable_get(:@env)
		end

		def test_environment_method_with_nested_hash
			@config.on(:dev) do |config|
				config[:database] = { host: 'localhost', port: 3306, name: 'my_project_dev' }
			end

			assert_pattern do
				@config.environment(:dev)[:database][:host] => 'localhost'
				@config.environment(:dev)[:database][:port] => 3306
				@config.environment(:dev)[:database][:name] => 'my_project_dev'
			end
		end

		def test_environment_returns_empty_hash_for_unknown_env
			@config.on(:dev) { |c| c[:foo] = 'bar' }

			assert_empty @config.environment(:unknown_env)
		end

		def test_environment_returns_correct_options
			env_name = :test_env
			expected_options = { option1: 'value1', option2: 'value2' }

			@config.on(env_name) do |c|
				c[:option1] = expected_options[:option1]
				c[:option2] = expected_options[:option2]
			end

			assert_equal expected_options, @config.environment(env_name)
		end
	end
end
