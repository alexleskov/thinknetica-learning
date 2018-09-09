require_relative 'instance_counter.rb'

class Station
  include InstanceCounter
  
  class << self
    attr_reader :all
  end

  @all = []

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
    self.class.all << self
    register_instance
  end

  def train_get(train)
    return if @trains.include?(train) || !train.is_a?(Train)  
    @trains << train
  end

  def train_send(train)
    trains.delete(train)
  end

  def trains_count_by_type(type)
    @trains.count { |train| train.types == type }
  end
end
