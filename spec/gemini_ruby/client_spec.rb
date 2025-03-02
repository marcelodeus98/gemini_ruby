require 'spec_helper'

RSpec.describe GeminiRuby::Client do
  let(:api_key) { "test_api_key" }
  let(:client) { described_class.new(api_key: api_key) }

  describe '#get_ticker' do
    it 'returns ticker data for a valid symbol' do
      # Mock da resposta da API
      stub_request(:get, "https://api.gemini.com/v1/pubticker/btcusd")
        .to_return(status: 200, body: '{
          "bid": "85535.63",
          "ask": "85555.10",
          "last": "85530.03",
          "volume": {
            "BTC": "164.62674554",
            "USD": "14080530.4848385662",
            "timestamp": 1740924917000
          }
        }')

      response = client.get_ticker('btcusd')
      expect(response).to be_a(Hash)
      expect(response['bid']).to eq('85535.63')
      expect(response['ask']).to eq('85555.10')
      expect(response['last']).to eq('85530.03')
      expect(response['volume']['BTC']).to eq('164.62674554')
      expect(response['volume']['USD']).to eq('14080530.4848385662')
      expect(response['volume']['timestamp']).to eq(1740924917000)
    end
  end
end