class CargoTrain < Train

  def initialize(valid_type = :cargo, type)
    @valid_type = valid_type
  end

end