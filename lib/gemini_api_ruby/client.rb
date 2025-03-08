module GeminiApiRuby
  class Client
    def initialize(api_key:)
      @api_key = api_key
    end

    def generate_text(prompt)
      response = request(:post, "/v1/generate", { prompt: prompt })
    end

    def get_ticker(symbol)
      request(:get, "/v1/pubticker/#{symbol}")
    end

    def get_order_book(symbol)
      request(:get, "/v1/book/#{symbol}")
    end

    private

    def request(method, endpoint, params = {})
      Request.new(api_key: @api_key).send(method, endpoint, params)
    end
  end
end
