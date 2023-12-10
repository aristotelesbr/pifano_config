# frozen_string_literal: true

require 'thread'

module Pifano
  module OptionFactory
    @struct_cache = {}
    @mutex = ::Mutex.new

    def self.build(hash)
      return unless hash.is_a?(::Hash)

      struct_key = hash.keys.sort.join('_').to_sym
      struct = get_or_create_struct(struct_key, hash.keys)

      struct.new(hash)
    end

    def self.get_or_create_struct(struct_key, keys)
      @mutex.synchronize do
        @struct_cache[struct_key] ||= create_struct(keys)
      end
    end
    private_class_method :get_or_create_struct

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
