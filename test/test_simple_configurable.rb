# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Aristóteles Coutinho.

require 'test_helper'

class TestSimpleConfigurable < Minitest::Test
	def test_that_it_has_a_version_number
		refute_nil ::PifanoConfig::VERSION
	end
end
