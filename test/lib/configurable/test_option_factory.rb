# frozen_string_literal: true

require 'test_helper'

module Configurable
  class TestOptionFactory < Minitest::Test
    def test_build
      hash = { a: 1, b: { c: 2 } }
      struct = Configurable::OptionFactory.build(hash)

      assert_equal(1, struct.a)
      assert_equal(2, struct.b.c)
    end

    def test_build_with_non_hash
      assert_nil(Configurable::OptionFactory.build(1))
    end
  end
end
