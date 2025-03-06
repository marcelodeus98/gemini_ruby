module GeminiApiRuby
  class Request
    def initialize(api_key:)
      @api_key = api_key
    end

    def send(method, endpoint, params = {})
      response = connection.send(method, endpoint, params) do |req|
        req.headers["Content-Type"] = "application/json"
        req.headers["X-GEMINI-APIKEY"] = @api_key
      end
      response.body
    end

    private

    def connection
      @connection ||= Faraday.new(url: GeminiApiRuby::BASE_URL) do |faraday|
        faraday.request :json
        faraday.response :json, content_type: /\bjson$/
        faraday.adapter Faraday.default_adapter
        faraday.request :retry
      end
    end
  end
end