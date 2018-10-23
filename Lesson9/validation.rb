module Validation
  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
    attr_reader :validations

    TYPES = [:presence, :format, :type]

    def validate(attribute, validation_type, option = nil)
      @validate_attribute = {attribute_name: attribute.to_sym, type: validation_type.to_sym, option: option}
      raise "Указанного типа валидации не существует" unless TYPES.include?(@validate_attribute[:type])
      if @validate_attribute[:type] == :format && !@validate_attribute[:option].is_a?(Regexp)
        raise "Опция для проверки формата должна иметь класс Regexp" 
      end
      if @validate_attribute[:type] == :type && !@validate_attribute[:option].is_a?(String)
        raise "Опция для проверки типа должна являться строкой"
      end

      @validations ||= []
      @validations << @validate_attribute
      
      #raise "Validation TypeName Error" if attribute_name.nil? || attribute_name.to_s.empty?  
    end 
  end

  module InstanceMethods

    def validate!
      self.class.validations.each do |validate_attribute|
        begin
        instance_attribute = self.send(validate_attribute[:attribute_name])
        rescue StandardError
          instance_attribute = nil
        end
        if instance_attribute.nil?
          raise "Проверяемый атрибут \"#{validate_attribute[:attribute_name]}\"
                отсутствует у объекта \"#{self}\"" 
        end
        case validate_attribute[:type]
        when :presence
          if instance_attribute.nil? && instance_attribute.to_s.empty?
            raise "ValidationError (Attribute is nil or empty String" 
          end
        when :format
          if instance_attribute !~ validate_attribute[:option]
            raise "ValidationError (Attribute don't match Regexp \"#{validate_attribute[:option]}\")" 
          end
        when :type
          if instance_attribute.class.to_s != validate_attribute[:option]
            raise "ValidationError (Attribute class not a \"#{validate_attribute[:option]}\")"
          end 
        end
      end
    end

    def valid?
      validate!
      true
    rescue StandardError => e
      puts e.inspect
      false
    end
  end
end

class Test
  include Validation

  attr_reader :name

  def initialize(name)
    @name = name
  end
end