require_relative 'company_name.rb'

class Wagon
  include CompanyName
  attr_reader :number, :type, :current_train

  def initialize(number, type)
    @number = number
    @type = type
    validate!
  end

  def validate!
    raise "Необходимо указать корректный номер для поезда" if number.to_i? <= 0
    raise "Необходимо указать верный тип для поезда: cargo или passenger" unless [:cargo,:passenger].include?(type)
    true
  end

  def valid?
    validate!
  rescue
    false
  end

  def set_current_train(train)
    @current_train = train
  end
end
