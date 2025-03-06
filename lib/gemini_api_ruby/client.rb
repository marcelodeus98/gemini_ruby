module GeminiApiRuby
  class Client
    def initialize(api_key:)
      @api_key = api_key
    end

    def get_ticker(symbol)
      response = request(:get, "/v1/pubticker/#{symbol}")
      response.body 
    end

    def get_order_book(symbol)
      response = request(:get, "/v1/book/#{symbol}")
      response.body
    end

    private

    def request(method, endpoint, params = {})
      Request.new(api_key: @api_key).send(method, endpoint, params)
    end
  end
end
