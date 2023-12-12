# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Aristóteles Coutinho.

require 'pifano/option_builder'

module Pifano
	# This class is used to set the options for a specific environment.
	#
	# @public Since `stable-v1`.
	class Config
		# Initialize the configuration.
		#
		# @parameter builder [OptionBuilder] The option builder.
		# Default is `OptionBuilder`.
		def initialize(builder: OptionBuilder.new)
			@builder = builder
			@options = {}
		end

		# Set the options for a specific environment.
		#
		# @parameter env [Symbol] The environment to set the options.
		# @parameter block [Proc] The block to set the options.
		#
		# @example
		#   config.on(:development) do |options|
		#		 options[:port] = 3000
		#   end
		#
		# @example
		def on(env)
			yield @builder if block_given?
			@options[env] = @builder.build
		end

		def environment(env) = @options[env]
	end

	# This module is used to include the `config` method in the class.
	#
	# @public Since `stable-v1`.
	module Mixin
		def self.included(klass)
			klass.extend(ClassMethods)
		end

		module ClassMethods
			# Get the configuration.
			#
			# @return [Config] The configuration.
			#
			# @example
			#   config.on(:development) do |options|
			#		 options[:port] = 3000
			def config
				@config ||= Config.new
			end
		end
	end
end
