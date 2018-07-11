class Route
  attr_reader :stations, :station_first, :station_last

  def initialize(departure, arrival)
    if departure.class == Station && arrival.class == Station
      @stations = [departure, arrival]
    end
  end

  def station_add(station)
    if station.class == Station && !stations.include?(station)
      @stations.insert(-2, station)
    end
  end

  def station_first
    stations.first
  end

  def station_last
    stations.last
  end

  def station_remove(station)
    if station.class == Station && stations.include?(station) &&
      station != station_first && station != station_last
      @stations.delete(station)
    end
  end

  def stations_list
    print "Список всех станций по порядку: "
    stations.each do |station|
      print "-[#{station.name}]-"
    end
  end
  
  def stations_between_list
    print "Промежуточные станции: "
    stations.each do |station|
      print "-[#{station.name}]-" if station != station_first && station != station_last
    end
  end
end
