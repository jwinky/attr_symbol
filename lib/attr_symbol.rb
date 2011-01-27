module ActiveRecord::AttrSymbol

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def attr_symbol(*attributes)
      attributes.each do |attr|
        define_method(attr) do
          self[attr].try(:to_sym)
        end

        define_method("#{attr}=") do |value|
          self[attr] = value.blank? ? nil : value.try(:to_s)
        end
      end
    end    
  end

end

ActiveRecord::Base.send(:include, ActiveRecord::AttrSymbol)
