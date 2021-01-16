# frozen_string_literal: true

require_relative "lib/string_dot_levenshtein/version"

Gem::Specification.new do |s|
	s.name = "string_dot_levenshtein"
	s.version = StringDotLevenshtein::VERSION
	s.authors = ["Sourav Goswami"]
	s.email = ["souravgoswami@protonmail.com"]
	s.summary = "An efficient Wagner Fischer levenshtein edit distance calculation in C Ruby"
	s.description = s.summary
	s.homepage = "https://github.com/Souravgoswami/string_dot_levenshtein"
	s.license = "MIT"
	s.required_ruby_version = Gem::Requirement.new(">= 2.5.0")
	s.files = Dir.glob(%w(ext/**/*.{rb,c} lib/**/*.rb))
	s.extensions = Dir.glob(%w(ext/**/*.rb))
	s.bindir = "exe"
	s.executables = s.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
	s.require_paths = ["lib"]
end
