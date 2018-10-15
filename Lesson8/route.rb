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
    if name.nil? || name.length < 2
      raise "Необходимо указать корректное название для маршрута. Не менее 2-х символов"
    end
    if @stations.any? { |station| !station.instance_of?(Station) }
      raise "Станции должны быть объектом класса Station"
    end
    if first_station == last_station
      raise "Пункт отправления и назначения должны быть разными станциями"
    end
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
