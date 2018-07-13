class Route
  attr_reader :stations

  def initialize(departure, arrival)
    if departure.class == Station && arrival.instance_of?(Station)
      @stations = [departure, arrival]
    end
  end

  def station_add(station)
    return if stations.include?(station) || !station.instance_of?(Station)
    @stations.insert(-2, station)
  end

  def first_station
    @stations.first
  end

  def last_station
    @stations.last
  end

  def station_remove(station)
    return unless [first_station, last_station].include?(station)
    @stations.delete(station)
  end

  def stations_list
    print "Список всех станций по порядку: "
    @stations.each do |station|
      print "-[#{station.name}]-"
    end
  end
end
