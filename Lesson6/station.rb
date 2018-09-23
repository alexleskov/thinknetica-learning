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
    validate!
    self.class.all << self
    register_instance
  end

  def validate!
    raise "Необходимо указать корректное название для станции. Не менее 2-х символов" if name.nil? || name.length < 2
    true
  end

  def valid?
    validate!
  rescue
    false
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
