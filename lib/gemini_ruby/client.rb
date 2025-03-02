module GeminiRuby
    class Client
      BASE_URL = "https://api.gemini.com".freeze
  
      def initialize(api_key:, api_secret:)
        @api_key = api_key
        @api_secret = api_secret
      end
  
      def get_ticker(symbol)
        request(:get, "/v1/pubticker/#{symbol}")
      end
  
      private
  
      def request(method, endpoint, params = {})
        Request.new(api_key: @api_key, api_secret: @api_secret).send(method, endpoint, params)
      end
    end
  end