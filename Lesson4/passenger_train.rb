class PassengerTrain < Train
  def initialize(number)
    super(number, :passenger)
  end

  def wagon_add(wagon)
    super if type == wagon.type
  end
end
