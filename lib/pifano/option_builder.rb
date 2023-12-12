# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Aristóteles Coutinho.

require 'pifano/option_factory'

module Pifano
	# This class is used to build the options.
	#
	class OptionBuilder
		# The hash to store the options.
		#
		attr_reader :config_hash

		# Initialize the option builder.
		#
		# @parameter config_hash [Hash] The hash to store the options.
		#
		def initialize = @config_hash = {}

		# Set the option.
		#
		# @parameter key [Symbol] The option name.
		# @parameter value [String] The option value.
		#
		def []=(key, value)
			@config_hash[key] = value
		end

		# Build the options.
		#
		# @parameter config_hash [Hash] The hash to store the options.
		#
		# @return [Struct] The options.
		#
		def build = OptionFactory.build(@config_hash)
	end
end
