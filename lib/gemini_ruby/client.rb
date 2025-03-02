# lib/gemini_ruby/client.rb

module GeminiRuby
    class Client
      BASE_URL = "https://api.gemini.com".freeze
  
      def initialize(api_key:, api_secret:)
        @api_key = api_key
        @api_secret = api_secret
      end
  
      # Exemplo de método para obter o ticker de um par de moedas
      def get_ticker(symbol)
        request(:get, "/v1/pubticker/#{symbol}")
      end
  
      # Exemplo de método para obter o livro de ordens
      def get_order_book(symbol)
        request(:get, "/v1/book/#{symbol}")
      end
  
      # Exemplo de método para criar uma nova ordem
      def create_order(symbol, amount, price, side)
        payload = {
          symbol: symbol,
          amount: amount,
          price: price,
          side: side
        }
        request(:post, "/v1/order/new", payload)
      end
  
      private
  
      def request(method, endpoint, params = {})
        Request.new(api_key: @api_key, api_secret: @api_secret).send(method, endpoint, params)
      end
    end
  end