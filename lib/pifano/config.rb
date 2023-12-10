# frozen_string_literal: true

require 'pifano/option_builder'

module Pifano
  class Config
    def initialize(builder: OptionBuilder.new)
      @builder = builder
      @options = {}
    end

    def on(env)
      yield @builder if block_given?
      @options[env] = @builder.build
    end

    def environment(env) = @options[env]
  end

  module Mixin
    def self.included(klass)
      klass.extend(ClassMethods)
    end

    module ClassMethods
      def config
        @config ||= Config.new
      end
    end
  end
end
