require_relative 'company_name.rb'

class Wagon
  include CompanyName
  attr_reader :number, :type, :current_train

  def initialize(number, type)
    @number = number
    @type = type
  end

  def set_current_train(train)
    @current_train = train
  end
end
