Gem::Specification.new do |spec|
    spec.name          = "tarta-api"
    spec.version       = "1.0.0"
    spec.authors       = ["tarta.ai"]
    spec.email         = ["taras@tarta.ai"]
  
    spec.summary       = "A Ruby wrapper for the Tarta API, enabling seamless integration of AI-powered job search functionality."
    spec.description   = "TartaAPI enables seamless integration of AI-driven job search capabilities into Ruby applications. Access a vast database of job listings, utilize AI matching algorithms, and automate interview scheduling, all through an easy-to-use interface with the Tarta API."

    spec.homepage      = "https://tarta.ai"
    spec.license       = "MIT"
  
    spec.files         = Dir["tarta_api.rb", "README.md", "LICENSE.txt"]
    spec.require_paths = ["."]
  
    spec.add_dependency "json"
    spec.add_dependency "net-http"
  
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/tarta-ai/TartaAPI-ruby"
    spec.metadata["api_uri"] = "https://api.tarta.net/swagger/index.html"
    spec.metadata["github_repo"] = "https://api.tarta.net/swagger/index.html"
    spec.metadata["allowed_push_host"] = "https://rubygems.org"

  end  