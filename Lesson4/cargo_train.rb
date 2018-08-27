class CargoTrain < Train
  def initialize(number)
    super(number, :cargo)
  end
  
  def wagon_add(wagon)
    super if type == wagon.type
  end
end
