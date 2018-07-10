class Station
  attr_reader :trains, :name, :passenger_trains_count, :cargo_trains_count

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_get(train)
    if train.class == Train && !trains.include?(train)
      @trains << train
    end
  end

  def train_send(train)
    if train.class == Train && trains.include?(train)
      trains.delete(train)
    end
  end

  def trains_count_by_type
    trains_types = []
    trains.each { |train| trains_types << train.type }
    @passenger_trains = trains_types.count("passenger")
    @cargo_trains_count = trains_types.count("cargo")
  end
end
