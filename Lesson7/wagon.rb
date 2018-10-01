require_relative 'company_name.rb'
require_relative 'validation.rb'

class Wagon
  include CompanyName
  include Validation

  attr_reader :number, :type, :current_train, :capacity, :occupied_capacity

  def initialize(number, capacity, type)
    @number = number
    @type = type
    @capacity = capacity
    @occupied_capacity = 0
    validate!
  end

  def validate!
    raise "Необходимо указать корректное значение для заполнения вагона" if capacity.nil? || capacity <= 0
    raise "Необходимо указать корректный номер для вагона" if number.nil? || number <= 0
    raise "Необходимо указать верный тип для вагона: cargo или passenger" unless [:cargo,:passenger].include?(type)
  end

  def set_current_train(train)
    @current_train = train
  end

  def free_capacity
    @free_capacity = @capacity - @occupied_capacity
  end

  def to_fill(value)
    raise "Значение заполняемости должно быть больше нуля" if value <= 0
    if free_capacity >= value
      @occupied_capacity = @capacity - @free_capacity -= value
    end
  end

  protected



end
