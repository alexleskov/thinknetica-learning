require_relative 'company_name.rb'
require_relative 'validation.rb'

class Wagon
  include CompanyName
  include Validation

  attr_reader :number, :type, :current_train, :capacity, :occupied_capacity

  validate :number, :presence
  validate :number, :type, "Integer"
  validate :type, :presence
  validate :type, :type, "Symbol"
  validate :capacity, :presence
  validate :capacity, :type, "Integer"

  def initialize(number, capacity, type)
    @number = number
    @type = type
    @capacity = capacity
    @occupied_capacity = 0
    validate!
  end

  def validate!
    super
    unless %i[cargo passenger].include?(type)
      raise "Необходимо указать верный тип для вагона: cargo или passenger"
    end
  end

  def set_current_train(train)
    @current_train = train
  end

  def free_capacity
    @free_capacity = @capacity - @occupied_capacity
  end

  def to_fill(value)
    raise "Значение заполняемости должно быть больше нуля" if value <= 0

    @occupied_capacity = @capacity - @free_capacity -= value if free_capacity >= value
  end
end
