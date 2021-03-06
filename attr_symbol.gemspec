# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{attr_symbol}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Justin Wienckowski"]
  s.date = %q{2011-01-27}
  s.description = %q{Attributes marked with the attr_symbol method can be set using strings or symbols, but when accessed will always return symbols.}
  s.email = %q{jwinky+gems@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "Gemfile",
    "VERSION",
    "attr_symbol.gemspec",
    "lib/attr_symbol.rb",
    "test/helper.rb",
    "test/test_attr_symbol.rb"
  ]
  s.homepage = %q{http://github.com/jwinky/attr_symbol}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Declare one or more attributes stored in string columns to be returned as symbols.}
  s.test_files = [
    "test/helper.rb",
    "test/test_attr_symbol.rb"
  ]
end

