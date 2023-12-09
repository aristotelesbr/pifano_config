# frozen_string_literal: true

require 'test_helper'

module Configurable
  class TestOptionBuilder < Minitest::Test
    def setup
      @builder = Configurable::OptionBuilder.new
    end

    def test_valid_instance
      assert_instance_of Configurable::OptionBuilder, @builder
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
