class CargoWagon < Wagon
  def initialize(number, capacity)
    super(number, capacity, :cargo)
  end

  def to_fill(value)
    raise "Заполняемый объем больше вмещаемости вагона" if free_capacity < value
    super
  end
end
