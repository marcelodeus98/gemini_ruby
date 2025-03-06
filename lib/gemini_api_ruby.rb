require "faraday"
require "faraday/retry"
require "json"

require_relative "gemini_api_ruby/version"
require_relative "gemini_api_ruby/errors"
require_relative "gemini_api_ruby/client"
require_relative "gemini_api_ruby/request"

module GeminiApiRuby
  BASE_URL = "https://api.gemini.com".freeze

  class Error < StandardError; end
end