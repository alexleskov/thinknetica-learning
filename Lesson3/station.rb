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
    @trains.delete(train) if trains.include?(train)
  end

  def trains_count_by_type(type)
    @trains.count { |train| train.types == type }
  end
end
