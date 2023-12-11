# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Aristóteles Coutinho.

require 'test_helper'

module Pifano
	class TestOptionFactory < Minitest::Test
		def test_build
			hash = { a: 1, b: { c: 2 } }
			struct = Pifano::OptionFactory.build(hash)

			assert_equal(1, struct.a)
			assert_equal(2, struct.b.c)
		end

		def test_build_with_non_hash
			assert_nil(Pifano::OptionFactory.build(1))
		end
	end
end
