require_relative 'instance_counter.rb'

class Route
  include InstanceCounter
  attr_reader :stations, :name

  def initialize(name, departure, arrival)
    if departure.instance_of?(Station) && arrival.instance_of?(Station)
      @name = name
      @stations = [departure, arrival]
      register_instance
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
    @stations.each do |station|
      print "-[#{station.name}]-"
    end
  end

  def first_station
    @stations.first
  end

  def last_station
    @stations.last
  end
end
