require 'helper'

class Thing < ActiveRecord::Tableless
  column :foo, :string
  column :bar, :integer
  
  attr_symbol :foo
end

class Node
  attr_symbol :type
  
  def initialize
    @type = :resource
  end
end

class TestAttrSymbol < Test::Unit::TestCase
  context "Normal object" do
    subject { Node.new }
    
    should("store the Symbol :collection in the 'type' attribute") do
      assert_equal :resource, subject.type
      subject.type = "     \r \n \r\n  \n\r  collection  \r \n \r\n  \n\rlol \r \n \r\n  \n\r     wtf omg "
      assert_equal :collection, subject.type
    end
  end
  
  context "Setting attribute 'foo'" do
    subject { Thing.new }

    context "to a non-blank string value" do
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

    context "to an empty string value" do
      setup { subject.foo = "" }
      should("store nil in the attribute") do
        assert_equal nil, subject[:foo]
      end
      should("return nil from the accessor") do
        assert_equal nil, subject.foo
      end
    end

    context "to a blank string value" do
      setup { subject.foo = "   " }
      should("store nil in the attribute") do
        assert_equal nil, subject[:foo]
      end
      should("return nil from the accessor") do
        assert_equal nil, subject.foo
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
end
