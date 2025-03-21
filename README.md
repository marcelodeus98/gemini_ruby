# GeminiApiRuby

A Ruby gem to interact with the Google Gemini API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gemini_api_ruby'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install gemini_api_ruby
```

## Configuration

Before using the gem, ensure you have your `GEMINI_API_KEY` set in your environment variables. You can do this by adding it to your `.env` file (if you're using something like `dotenv`), or exporting it directly in your shell:

```bash
export GEMINI_API_KEY='your_api_key_here'
```

## Usage

Here's an example of how to use the gem to interact with the Gemini API:

```ruby
# Initialize the GeminiApiRuby client with your API key
client = GeminiApiRuby::Client.new(api_key: ENV['GEMINI_API_KEY'])

# Define some sample prompts for generating travel plans
PROMPTS = [
  "Crie um plano de viagem de 3 dias para Paris, incluindo pontos turísticos e restaurantes.",
  "Sugira um roteiro de 5 dias para uma viagem ao Japão, com foco em cultura e gastronomia.",
  "Planeje uma viagem de aventura de 7 dias para a Nova Zelândia, com atividades ao ar livre.",
  "Desenvolva um plano de viagem romântico de 4 dias para Veneza, incluindo passeios de gôndola e jantares especiais.",
  "Crie um roteiro de 10 dias para uma viagem pela Costa Oeste dos Estados Unidos, incluindo parques nacionais e cidades."
]

# Example API call using a random prompt
get '/random_travel_plan' do
  prompt = PROMPTS.sample

  # Generate content using the client
  travel_plan = client.generate_content(prompt)

  # Return the generated content as a JSON response
  content_type :json
  { prompt: prompt, travel_plan: travel_plan }.to_json
end
```

## Changelog

### v1.0.0

- Initial release of the GeminiApiRuby gem.
- Basic functionality to interact with the Google Gemini API for generating content.

