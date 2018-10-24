module Accessors
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        values = []
        var_name = "@#{name}".to_sym
        define_method("#{name}_history") { instance_variable_get(var_name) }
        define_method("#{name}=") { |value| instance_variable_set(var_name, values << value) }
      end
    end

    def strong_attr_accessor(name, type)
      accessor_type = type.to_sym
      var_name = "@#{name}".to_sym
      define_method(name.to_s) { instance_variable_get(var_name) }
      define_method("#{name}=") do |data|
        value, type = data
        raise "Некорректный тип инстанс-переменной" if accessor_type != type

        instance_variable_set(var_name, value)
      end
    end
  end
end
