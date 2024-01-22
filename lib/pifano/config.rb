# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Aristóteles Coutinho.

module Pifano
	# This class is used to set the options for a specific environment.
	#
	# @public Since `stable-v1`.
	#
	class Config
		# @!attribute [r] options
		#   @returns [Hash] The options.
		attr_reader :options

		# @!attribute [r] env
		#   @returns [Symbol] The environment.
		attr_reader :env

		# Initialize the configuration.
		#
		def initialize
			@options = {}
			@env = nil
		end

		# Set the options for a specific environment.
		#
		# @parameter env [Symbol] The environment to set the options.
		# @yields {...} When a block is given, the block is yielded with the option.
		#
		def on(env)
			raise ArgumentError, 'Block is required.' unless block_given?

			@env = env
			yield self
			@env = nil
		end

		# Get the options for a specific environment.
		#
		# @parameter env_name [Symbol] The environment to get the options.
		# @yields {...} When a block is given, the block is yielded with the option.
		#
		# @returns [Hash] The options.
		#
		def environment(env_name)
			return {} unless @options.key?(env_name)

			@env = env_name
			yield self if block_given?
			@env = nil
			@options[env_name]
		end

		# Set the option for a specific environment.
		#
		# @parameter key [Symbol] The option name.
		# @parameter value [String] The option value.
		#
		# @returns [Nil] The option value.
		#
		def []=(key, value)
			@options[@env] ||= {}
			@options[@env][key] = value
		end

		# Get the option for a specific environment.

		# @parameter env [Symbol] The environment to get the option.
		# @parameter key [Symbol] The option name.
		#
		# @returns [String] The option value.
		#
		def [](env, key) = @options[env][key]
	end

	# This module is used to include the `config` method in the class.
	#
	# @public Since `stable-v1`.
	#
	module Mixin
		def self.included(klass)
			klass.extend(ClassMethods)
		end

		# Extend the class methods.
		#
		module ClassMethods
			# Get the configuration.
			#
			# @returns [Config] The configuration.
			#
			def config
				@config ||= Config.new
			end
		end
	end
end
