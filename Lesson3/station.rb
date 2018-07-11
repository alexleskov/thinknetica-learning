class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_get(train)
    if !trains.include?(train)
      @trains << train
    end
  end

  def train_send(train)
    if trains.include?(train)
      @trains.delete(train)
    end
  end

  def trains_count_by_type(type)
    if type == "passenger"
      passenger_trains = trains.type.count("passenger")
    elsif type == "cargo"
      cargo_trains_count = trains.type.count("cargo")
    end
  end
end
