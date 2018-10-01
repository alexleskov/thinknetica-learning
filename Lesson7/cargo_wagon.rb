class CargoWagon < Wagon
  def initialize(number, capacity)
    super(number, capacity, :cargo)
  end

  def to_fill(value)
    raise "Заполняемый объем (#{value} кубометров) больше остаточной вместимости вагона (#{free_capacity} кубометров). Вместимость: #{capacity} кубометров" if free_capacity < value
    super
  end
end
