require 'helper'

class Thing < ActiveRecord::Tableless
  column :foo, :string
  column :bar, :integer
  
  attr_symbol :foo
end


class TestAttrSymbol < Test::Unit::TestCase
  context "Setting attribute 'foo'" do
    subject { Thing.new }

    context "to a string value" do
      setup { subject.foo = "bar" }
      should("store the string 'bar' in the attribute") do
        assert_equal "bar", subject[:foo]
      end
      should("return the symbol :bar from the accessor") do
        assert_equal :bar, subject.foo
      end
    end

    context "to a symbol" do
      setup { subject.foo = :bar }
      should("store the string 'bar' in the attribute") do
        assert_equal "bar", subject[:foo]
      end
      should("return the symbol :bar from the accessor") do
        assert_equal :bar, subject.foo
      end
    end

    context "to nil" do
      setup { subject.foo = nil }
      should("store nil in the attribute") do
        assert_equal nil, subject[:foo]
      end
      should("return nil from the accessor") do
        assert_equal nil, subject.foo
      end
    end
  end

  context "Calling #attr_symbol with a column that does not exist" do
    should "raise ArgumentError" do
      begin
        Thing.send(:attr_symbol, :missing_attr)
        fail "Expected ArgumentError but no exception thrown"
      rescue ArgumentError => e
        assert_equal "Attribute :missing_attr is not a database column of type string", e.message
      end
    end
  end

  context "Calling #attr_symbol with a column that is not a string" do
    should "raise ArgumentError" do
      begin
        Thing.send(:attr_symbol, :bar)
        fail "Expected ArgumentError but no exception thrown"
      rescue ArgumentError => e
        assert_equal "Attribute :bar is not a database column of type string", e.message
      end
    end
  end
end
