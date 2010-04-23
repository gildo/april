require 'rake/gempackagetask'

SPEC = Gem::Specification.new do |s|
  s.name = 'april'
  s.version = '0.0.1pre'
  s.author = 'fyskij'
  s.email = 'fyskij@gmail.com'
  s.homepage = 'http://github.com/fyskij/april'
  s.summary = 'IRC Client Library'
  s.description = s.summary
  s.platform = Gem::Platform::RUBY
  s.files = Dir.glob('lib/**/*.rb')
  s.require_path = 'lib'
  s.add_dependency('rake', '>= 0.7')
end

desc 'Build gem'
Rake::GemPackageTask.new(SPEC) do |pkg|
  pkg.gem_spec = SPEC
end

desc "install the gem"
task :install => [:package] do
  sh %{sudo gem install pkg/*}
end

task :default => :package

