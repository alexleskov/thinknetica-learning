class CargoTrain < Train

  def initialize(number, type)
    return if type != :cargo
    super
  end

  def vagon_add(vagon)
    super if vagon.type == :cargo
  end

end