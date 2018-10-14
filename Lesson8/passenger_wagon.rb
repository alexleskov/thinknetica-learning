class PassengerWagon < Wagon
  CAPACITY_CHANGE_VALUE = 1

  def initialize(number, capacity)
    super(number, capacity, :passenger)
  end

  def to_fill
    raise "Все места в вагоне уже заняты. Вместимость: #{capacity} мест" if free_capacity.zero?

    super(CAPACITY_CHANGE_VALUE)
  end
end
