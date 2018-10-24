require_relative 'instance_counter.rb'
require_relative 'validation.rb'

class Station
  include InstanceCounter
  include Validation

  class << self
    attr_reader :all
  end

  @all = []

  attr_reader :trains, :name

  validate :name, :presence
  validate :name, :type, "String"

  def initialize(name)
    @name = name
    @trains = []
    validate!
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

  def station_trains(block)
    trains.each { |train| block.call(train) }
  end
end
