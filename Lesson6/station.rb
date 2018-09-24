require_relative 'instance_counter.rb'
require_relative 'valid.rb'

class Station
  include InstanceCounter
  include Valid
  
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
