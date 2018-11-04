require_relative 'instance_counter.rb'
require_relative 'validation.rb'

class Route
  include InstanceCounter
  include Validation

  attr_reader :stations, :name

  validate :name, :presence
  validate :name, :type, String
  validate :departure, :type, Station
  validate :arrival, :type, Station

  def initialize(name, departure, arrival)
    @name = name
    @stations = [departure, arrival]
    validate!
    register_instance
  end

  def validate!
    super
    raise "Пункт отправления и назначения должны быть разными станциями" if arrival == departure
  end

  def station_add(station)
    return if stations.include?(station) || !station.instance_of?(Station)

    @stations.insert(-2, station)
  end

  def station_remove(station)
    return if [first_station, last_station].include?(station)

    @stations.delete(station)
  end

  def stations_list
    print "Список всех станций по порядку: "
    @stations.each { |station| print "-[#{station.name}]-" }
  end

  def first_station
    @stations.first
  end

  alias departure first_station

  def last_station
    @stations.last
  end

  alias arrival last_station
end
