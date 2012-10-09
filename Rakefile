require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "attr_symbol"
    gem.summary = "Declare one or more ActiveRecord attributes stored in string columns to be returned as symbols."
    gem.description = "Attributes marked with the attr_symbol method can be set using strings or symbols, but when accessed will always return symbols."
    gem.email = "jwinky+gems@gmail.com"
    gem.homepage = "http://github.com/jwinky/attr_symbol"
    gem.authors = ["Justin Wienckowski"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test
