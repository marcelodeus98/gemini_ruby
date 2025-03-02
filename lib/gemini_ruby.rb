# lib/gemini_ruby.rb

require "faraday"
require "faraday/retry"
require "json"

require_relative "gemini_ruby/version"
require_relative "gemini_ruby/errors"
require_relative "gemini_ruby/client"
require_relative "gemini_ruby/request"

module GeminiRuby
  class Error < StandardError; end
end