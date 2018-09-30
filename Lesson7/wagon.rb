require_relative 'company_name.rb'
require_relative 'validation.rb'

class Wagon
  include CompanyName
  include Validation

  attr_reader :number, :type, :current_train

  def initialize(number, type)
    @number = number
    @type = type
    validate!
  end

  def validate!
    raise "Необходимо указать корректный номер для поезда" if number.nil? || number <= 0
    raise "Необходимо указать верный тип для поезда: cargo или passenger" unless [:cargo,:passenger].include?(type)
  end

  def set_current_train(train)
    @current_train = train
  end
end
