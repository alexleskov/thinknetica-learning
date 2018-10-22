class PassengerTrain < Train
  class << self
    attr_reader :all
  end

  @all = {}

  def initialize(number)
    super(number, :passenger)
  end

  def wagon_add(wagon)
    super if type == wagon.type
  end
end
