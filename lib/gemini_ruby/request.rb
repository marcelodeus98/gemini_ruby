module GeminiRuby
    class Request
      def initialize(api_key:, api_secret:)
        @api_key = api_key
        @api_secret = api_secret
      end
  
      def send(method, endpoint, params = {})
        connection.send(method, endpoint, params) do |req|
          req.headers["Content-Type"] = "application/json"
          req.headers["X-GEMINI-APIKEY"] = @api_key
          req.headers["X-GEMINI-PAYLOAD"] = generate_payload(params)
        end
      end
  
      private
  
      def connection
        @connection ||= Faraday.new(url: BASE_URL) do |faraday|
          faraday.request :json
          faraday.response :json, content_type: /\bjson$/
          faraday.adapter Faraday.default_adapter
          faraday.request :retry
        end
      end
  
      def generate_payload(params)
        payload = params.merge(nonce: (Time.now.to_f * 1_000_000).to_i)
        Base64.strict_encode64(JSON.generate(payload))
      end
    end
  end