# spec/gemini_ruby/client_spec.rb

require "spec_helper"

RSpec.describe GeminiRuby::Client do
  let(:api_key) { "test_api_key" }
  let(:api_secret) { "test_api_secret" }
  let(:client) { described_class.new(api_key: api_key, api_secret: api_secret) }

  describe "#get_ticker" do
    it "returns ticker data" do
      stub_request(:get, "https://api.gemini.com/v1/pubticker/btcusd")
        .to_return(status: 200, body: '{"bid":"50000","ask":"50010"}')

      response = client.get_ticker("btcusd")
      expect(response.body).to eq({ "bid" => "50000", "ask" => "50010" })
    end
  end
end