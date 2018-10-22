module Validation
  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
    def validation(attribute_name, validation_type, options = {})
      condition = options[:condition] || :none

      case validation_type
      when :presence
        raise "Validation TypeName Error" if attribute_name.nil? || attribute_name.to_s.empty?  
      when :format
      when :type
      end
    end 
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end
end

class Test
  include Validation

end

