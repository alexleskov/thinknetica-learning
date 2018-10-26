require_relative 'accessors.rb'

module CompanyName
  include Accessors

  strong_attr_accessor :company_name, String
end
