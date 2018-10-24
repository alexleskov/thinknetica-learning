class CargoWagon < Wagon
  def initialize(number, capacity)
    super(number, capacity, :cargo)
  end

  def to_fill(value)
    if free_capacity < value
      raise "Заполняемый объем (#{value} кубометров) больше остаточной вместимости вагона
            (#{free_capacity} кубометров). Вместимость: #{capacity} кубометров"
    end
    super
  end
end
