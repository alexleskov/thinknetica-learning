class PassengerTrain < Train

  def initialize(number, type)
    return if type != :passenger
    super
  end

end