# frozen_string_literal: true

require 'pifano/option_factory'

module Pifano
  class OptionBuilder
    attr_reader :config_hash

    def initialize = @config_hash = {}

    def []=(key, value)
      @config_hash[key] = value
    end

    def build = OptionFactory.build(@config_hash)
  end
end
