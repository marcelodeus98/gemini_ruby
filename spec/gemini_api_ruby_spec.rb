require 'spec_helper'

RSpec.describe GeminiRuby::Client do
  let(:api_key) { ENV['GEMINI_API_KEY'] }
  let(:client) { described_class.new(api_key: api_key) }

  describe '#get_ticker' do
    it 'returns ticker data for a valid symbol' do
      # Mock da resposta da API
      stub_request(:get, "https://api.gemini.com/v1/pubticker/btcusd")
        .to_return(status: 200, body: '{"bid":"50000","ask":"50010"}')

      response = client.get_ticker('btcusd')
      expect(response).to be_a(Hash)
      expect(response['bid']).to eq('50000')
      expect(response['ask']).to eq('50010')
    end
  end
end