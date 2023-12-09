# frozen_string_literal: true

require 'test_helper'

module Configurable
  class TestConfig < Minitest::Test
    include Configurable

    def setup
      @config = Configurable::Config.new
    end

    def test_on_method
      @config.on(:dev) do |config|
        config[:option] = 'dev_value'
      end

      assert_equal 'dev_value', @config.environment(:dev).option
      assert_nil @config.environment(:test)
    end

    def test_environment_method
      @config.on(:dev) do |config|
        config[:option] = 'dev_value'
      end

      assert_equal 'dev_value', @config.environment(:dev).option
      assert_nil @config.environment(:test)
    end

    def test_environment_method_with_nested_hash
      @config.on(:dev) do |config|
        config[:database] = {
          host: 'localhost',
          port: 3306,
          name: 'my_project_dev'
        }
      end

      assert_pattern do
        @config.environment(:dev).database.host => 'localhost'
        @config.environment(:dev).database.port => 3306
        @config.environment(:dev).database.name => 'my_project_dev'
      end
    end
  end
end
