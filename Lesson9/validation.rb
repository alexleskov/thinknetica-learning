module Validation
  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
    attr_reader :validations

    TYPES = %i[presence format type].freeze

    def validate(attribute, validation_type, option = nil)
      @validate_attribute = { attribute_name: attribute.to_sym, type: validation_type.to_sym,
                              option: option }
      check_validate_attribute
      @validations ||= []
      @validations << @validate_attribute
    end

    protected

    def check_validate_attribute
      unless TYPES.include?(@validate_attribute[:type])
        raise "Типа валидации \"#{@validate_attribute[:type]}\" - не существует"
      end

      if @validate_attribute[:type] == :format && !@validate_attribute[:option].is_a?(Regexp)
        raise "Опция для проверки формата должна иметь класс Regexp"
      end
      if @validate_attribute[:type] == :type && !@validate_attribute[:option].is_a?(String)
        raise "Опция для проверки типа должна являться строкой"
      end
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError => e
      puts e.inspect
      false
    end

    def validate!
      object = self

      object.class.validations.each do |validate_attribute|
        attribute_name = validate_attribute[:attribute_name]
        option = validate_attribute[:option]

        begin
          instance_attribute = object.send(attribute_name)
        rescue StandardError
          instance_attribute = nil
        end
        if instance_attribute.nil?
          raise "ValidationError: \"#{attribute_name}\" don't exist in \"#{object}\""
        end

        case validate_attribute[:type]
        when :presence
          if instance_attribute.nil? || instance_attribute.to_s.empty?
            raise "ValidationError: \"#{attribute_name}\" is nil or empty string in \"#{object}\""
          end
        when :format
          if instance_attribute !~ option
            raise "ValidationError: \"#{attribute_name}\"
                  don't match Regexp \"#{option}\" in \"#{object}\""
          end
        when :type
          if instance_attribute.class.to_s != validate_attribute[:option]
            raise "ValidationError: \"#{attribute_name}\" class
                  is not a \"#{option}\" in \"#{object}\""
          end
        end
      end
    end
  end
end
