class Route
  attr_reader :stations

  def initialize(departure, arrival)
    if departure.class == Station && arrival.class == Station
      @stations = [departure, arrival]
    end
  end

  def station_add(station)
    return if stations.include?(station) || station.class != Station
      @stations.insert(-2, station)
    end
  end

  def first_station
    stations.first
  end

  def last_station
    stations.last
  end

  def station_remove(station)
    if [first_station, last_station].index(station).nil?
      @stations.delete(station)
    end
  end

  def stations_list
    print "Список всех станций по порядку: "
    stations.each do |station|
      print "-[#{station.name}]-"
    end
  end
end
