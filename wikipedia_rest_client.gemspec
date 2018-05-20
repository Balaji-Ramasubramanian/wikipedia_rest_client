
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wikipedia_rest_client/version"

Gem::Specification.new do |spec|
  spec.name          = "wikipedia_rest_client"
  spec.version       = WikipediaRestClient::VERSION
  spec.authors       = ["Balaji"]
  spec.email         = ["balaji030698@gmail.com"]

  spec.summary       = %q{This is ruby gem for getting Wikipedia contents.}
  spec.description   = %q{By using this gem, we can get Wikipedia content, today's featured article, and picture of the day from Wikipedia.}
  spec.homepage      = "https://github.com/Balaji-Ramasubramanian/wikipedia_rest_client.git"
  spec.license       = "MIT"
  spec.files         = ['lib/wikipedia_rest_client/version.rb',
                        'lib/wikipedia_rest_client/utils.rb',
                        'lib/wikipedia_rest_client/page.rb',
                        'lib/wikipedia_rest_client/today_featured_article.rb',
                        'lib/wikipedia_rest_client/image_of_the_day.rb'
                        ]
  # spec.files = Dir['lib/**/*.rb']

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "json", "~> 2.0.2"
  spec.add_runtime_dependency "httparty", "~> 0.15.6"
end
