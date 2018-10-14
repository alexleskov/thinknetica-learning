module InstanceCounter
  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
    attr_accessor :instances_count

    def init_instances_count
      @instances_count ||= 0
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.init_instances_count
      self.class.instances_count += 1
    end
  end
end
