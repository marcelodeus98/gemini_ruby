# GeminiApiRuby

Uma gem Ruby para interagir com a API Google Gemini.

## Instalação

Adicione esta linha ao Gemfile da sua aplicação:

```ruby
gem 'gemini_api_ruby'
```

Em seguida, execute:

```bash
bundle install
```

Ou instale manualmente com:

```bash
gem install gemini_api_ruby
```

## Configuração

Antes de usar a gem, certifique-se de que sua chave `GEMINI_API_KEY` está definida nas variáveis de ambiente. Você pode fazer isso adicionando-a ao seu arquivo `.env` (caso utilize `dotenv`) ou exportando diretamente no terminal:

```bash
export GEMINI_API_KEY='sua_chave_api_aqui'
```

## Uso

Aqui está um exemplo de como usar a gem para interagir com a API Gemini:

```ruby
# Inicializa o cliente GeminiApiRuby com sua chave API
client = GeminiApiRuby::Client.new(api_key: ENV['GEMINI_API_KEY'])

# Define alguns prompts de exemplo para geração de planos de viagem
PROMPTS = [
  "Crie um plano de viagem de 3 dias para Paris, incluindo pontos turísticos e restaurantes.",
  "Sugira um roteiro de 5 dias para uma viagem ao Japão, com foco em cultura e gastronomia.",
  "Planeje uma viagem de aventura de 7 dias para a Nova Zelândia, com atividades ao ar livre.",
  "Desenvolva um plano de viagem romântico de 4 dias para Veneza, incluindo passeios de gôndola e jantares especiais.",
  "Crie um roteiro de 10 dias para uma viagem pela Costa Oeste dos Estados Unidos, incluindo parques nacionais e cidades."
]

# Exemplo de chamada de API usando um prompt aleatório
get '/random_travel_plan' do
  prompt = PROMPTS.sample

  # Gera o conteúdo usando o cliente
  travel_plan = client.generate_content(prompt)

  # Retorna o conteúdo gerado como resposta JSON
  content_type :json
  { prompt: prompt, travel_plan: travel_plan }.to_json
end
```

## Registro de Alterações

### v1.0.0

- Lançamento inicial da gem GeminiApiRuby.
- Funcionalidade básica para interagir com a API Google Gemini e gerar conteúdo.

