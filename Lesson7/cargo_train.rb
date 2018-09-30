class CargoTrain < Train

  class << self
    attr_reader :all
  end

  @all = {}
  
  def initialize(number)
    super(number, :cargo)
  end
  
  def wagon_add(wagon)
    super if type == wagon.type
  end
end
