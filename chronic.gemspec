$:.unshift File.expand_path('../lib', __FILE__)
require 'chronic'

Gem::Specification.new do |s|
  s.name = 'muflax-chronic'
  s.version = Chronic::VERSION
  s.rubyforge_project = 'chronic'
  s.summary     = 'Natural language date/time parsing.'
  s.description = 'A slightly saner fork of Chronic.'
  s.authors  = ['muflax', 'Tom Preston-Werner', 'Lee Jarvis']
  s.email    = ['mail@muflax.com', 'tom@mojombo.com', 'lee@jarvis.co']
  s.homepage = 'http://github.com/muflax/chronic'
  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = %w[README.md HISTORY.md LICENSE]
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- test`.split("\n")
end
