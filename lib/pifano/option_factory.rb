# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Aristóteles Coutinho.

require 'thread'

module Pifano
	# This module is used to create the options.
	#
	module OptionFactory
		# The hash to store the structs.
		#
		@struct_cache = {}
		# The mutex to synchronize the access to the hash.
		#
		@mutex = ::Mutex.new

		# Build the options.
		#
		# @parameter hash [Hash] The hash to build the options.
		#
		# @return [Struct] The options.
		#
		def self.build(hash)
			return unless hash.is_a?(::Hash)

			struct_key = hash.keys.sort.join('_').to_sym
			struct = get_or_create_struct(struct_key, hash.keys)

			struct.new(hash)
		end

		# Get or create the struct.
		#
		# @private
		#
		# @parameter struct_key [Symbol] The struct key.
		# @parameter keys [Array] The struct keys.
		#
		# @return [Struct] The struct.
		#
		def self.get_or_create_struct(struct_key, keys)
			@mutex.synchronize do
				@struct_cache[struct_key] ||= create_struct(keys)
			end
		end
		private_class_method :get_or_create_struct

		# Create the struct.
		#
		# @private
		#
		# @parameter keys [Array] The struct keys.
		#
		# @return [Struct] The struct.
		#
		def self.create_struct(keys)
			Struct.new(*keys, keyword_init: true) do
				def initialize(hash)
					hash.each do |k, v|
						self[k] = v.is_a?(::Hash) ? OptionFactory.build(v) : v
					end
					freeze
				end
			end
		end
		private_class_method :create_struct
	end
end
