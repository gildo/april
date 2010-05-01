require "rake"
require "rake/clean"
require 'rake/gempackagetask'

require 'lib/april'

NAME = 'april'
VERSION = APRIL::VERSION

CLEAN.include ["*.gem"]

desc "Package"
task :package => [:clean] do |p|
  sh "gem build april.gemspec"
end

desc "Install gem"
task :install => [:package] do
  sh "sudo gem install ./#{NAME}-#{VERSION}"
end

task :default => :clean

