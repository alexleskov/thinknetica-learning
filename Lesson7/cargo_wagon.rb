class CargoWagon < Wagon
  attr_reader :volume, :occupied_volume

  def initialize(number, volume, occupied_volume = 0)
    @volume = volume
    @occupied_volume = occupied_volume
    super(number, :cargo)
  end

  def fill_the_volume(value)
    raise "Значение должно быть больше нуля" if value <= 0
    raise "Заполняемый объем больше вмещаемости вагона" if volume < value
    if volume >= value
      @volume -= value
      @occupied_volume += value
    end    
  end

  def validate!
    raise "Необходимо указать корректный объем вмещаемости для вагона" if volume.nil? || volume <= 0
    super
  end

end
