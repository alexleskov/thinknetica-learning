module InstanceCounter

  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
    attr_accessor :instances
    
    def init
      @instances ||= 0
    end
  end

  module InstanceMethods

    protected
    
    def register_instance
      self.class.init
      self.class.instances += 1
    end
  end
end