require = 'gemini_api_ruby'

client = GeminiApiRuby::Client.new(api_key: 'AIzaSyBzvd2PvZTBKXnENzXwH4IMBcAMdwV4sz8')

ticker = client.get_ticker('btcusd')
puts "Ticker do BTCUSD:"
puts ticker

order_book = client.get_order_book('btcusd')
puts "\nLivro de ordens do BTCUSD:"
puts order_book