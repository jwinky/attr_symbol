require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'active_record'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'attr_symbol'

class Test::Unit::TestCase
end

# So we can test without having a database.
# From http://stackoverflow.com/questions/937429/activerecordbase-without-table-rails
class ActiveRecord::Tableless < ActiveRecord::Base
  def self.columns
    @columns ||= [];
  end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default,
      sql_type.to_s, null)
  end

  # Override the save method to prevent exceptions.
  def save(validate = true)
    validate ? valid? : true
  end
end