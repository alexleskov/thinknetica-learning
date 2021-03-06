require_relative 'instance_counter.rb'
require_relative 'validation.rb'

class Route
  include InstanceCounter
  include Validation

  attr_reader :stations, :name

  def initialize(name, departure, arrival)
      @name = name
      @stations = [departure, arrival]
      validate!
      register_instance
  end

  def validate!
    raise "Необходимо указать корректное название для маршрута. Не менее 2-х символов" if name.nil? || name.length < 2
    raise "Станции должны является объектом класса Station" if @stations.any? { |station| !station.instance_of?(Station) }
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

  def last_station
    @stations.last
  end
end
