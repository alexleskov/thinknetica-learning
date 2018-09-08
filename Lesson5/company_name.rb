module CompanyName

  def self.included(base)
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    attr_reader :company_name
    
    def set_company_name(name)
      @company_name = name
    end
  end
end