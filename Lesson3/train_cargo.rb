class CargoTrain < Train

  def initialize(number, type, vagon_count)
    return if type != :cargo
    super
  end
  
end