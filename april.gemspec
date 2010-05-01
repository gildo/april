require File.expand_path("../lib/april", __FILE__)

SPEC = Gem::Specification.new do |s|
  s.name = 'april'
  s.version = APRIL::VERSION
  s.author = 'fyskij'
  s.email = 'fyskij@gmail.com'
  s.homepage = 'http://github.com/fyskij/april'
  s.summary = 'IRC Client Library'
  s.description = s.summary
  s.platform = Gem::Platform::RUBY
  s.files = %w(README.markdown CHANGES.markdown) + Dir["{lib,etc,examples}/**/*"]
  s.executables = ['bot']
  s.require_path = 'lib'
  s.has_rdoc = false
end

