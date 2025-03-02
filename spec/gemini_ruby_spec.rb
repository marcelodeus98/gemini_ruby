# gemini_ruby.gemspec

require_relative 'lib/gemini_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "gemini_ruby"
  spec.version       = GeminiRuby::VERSION
  spec.authors       = ["Marcelo Deus"]
  spec.email         = ["marcelodeus98@gmail.com"]

  spec.summary       = "Ruby gem to interact with the Google Gemini API."
  spec.description   = "A modern, performant, and secure Ruby gem for integrating with the Google Gemini API."
  spec.homepage      = "https://github.com/seu_usuario/gemini_ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/marcelodeus98/gemini_ruby"
  spec.metadata["changelog_uri"] = "https://github.com/marcelodeus98/gemini_ruby/blob/main/CHANGELOG.md"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 2.0"
  spec.add_dependency "faraday-retry", "~> 2.0"
  spec.add_dependency "json", "~> 2.5"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.21"
  spec.add_development_dependency "webmock", "~> 3.14"
end