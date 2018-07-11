class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_get(train)
    return if trains.include?(train) || train.class != Train
      @trains << train
  end

  def train_send(train)
    if trains.include?(train)
      @trains.delete(train)
    end
  end

  def trains_type
    trains.type
  end

  def trains_count_by_type(type)
    trains_types = []
      trains.each { |train| trains_types << train.type }
    if type == :passenger
      passenger_trains = trains_types.count(type)
    elsif type == :cargo
      cargo_trains_count = trains_types.count(type)
    end
  end
end
