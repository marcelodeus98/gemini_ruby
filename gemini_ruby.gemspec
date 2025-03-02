# frozen_string_literal: true

require_relative "lib/gemini_ruby/version"

Gem::Specification.new do |spec|
  spec.name = "gemini_ruby"
  spec.version = GeminiRuby::VERSION
  spec.authors = ["marcelodeus98"]
  spec.email = ["marcelodeus8@gmail.com"]

  spec.summary = "Ruby gem to interact with the Google Gemini API."
  spec.description = "A modern, performant, and secure Ruby gem for integrating with the Google Gemini API."
  spec.homepage = "https://github.com/marcelodeus98/gemini_ruby" # Atualize com o link do seu repositório
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # URLs válidas para o repositório e changelog
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/marcelodeus98/gemini_ruby"
  spec.metadata["changelog_uri"] = "https://github.com/marcelodeus98/gemini_ruby/blob/main/CHANGELOG.md"

  # Lista de arquivos incluídos na gem
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Dependências
  spec.add_dependency "faraday", "~> 2.0"
  spec.add_dependency "faraday-retry", "~> 2.0"
  spec.add_dependency "json", "~> 2.5"

  # Dependências de desenvolvimento
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.21"
  spec.add_development_dependency "webmock", "~> 3.14"
end