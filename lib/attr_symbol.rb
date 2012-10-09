require 'pathname'

class Module
  def attr_symbol(*attributes)
    attributes.each do |attribute|
      attr_reader attribute.to_sym
      
      define_method("#{attribute}=") { |value| instance_variable_set("@#{attribute}", value.to_s.strip.lines.first.strip.to_sym) }
    end
  end
end

if defined?(ActiveRecord)
  module ActiveRecord::AttrSymbol
    VERSION = Pathname.new(__FILE__).join('../../VERSION').read.strip
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      
      def attr_symbol(*attributes)
        attributes.each do |attribute|
          define_method(attribute) do
            self[attribute].try(:to_sym)
          end
          
          define_method("#{attribute}=") do |value|
            self[attribute] = value.blank? ? nil : value.try(:to_s)
          end
        end
      end
      
    end
    
  end
  
  ActiveRecord::Base.send(:include, ActiveRecord::AttrSymbol)
end
