# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Aristóteles Coutinho.

require 'test_helper'

module Pifano
	class TestOptionBuilder < Minitest::Test
		def setup
			@builder = Pifano::OptionBuilder.new
		end

		def test_valid_instance
			assert_instance_of Pifano::OptionBuilder, @builder
			assert_empty(@builder.config_hash)
		end

		def test_setter
			@builder[:option] = 'value'

			assert_equal 'value', @builder.config_hash[:option]
		end

		def test_build_option
			@builder[:option] = 'value'

			assert_equal 'value', @builder.build.option
		end

		def test_build_with_block_and_args
			@builder[:option] = 'value'

			assert_equal 'value', @builder.build(&:option).option
		end
	end
end
