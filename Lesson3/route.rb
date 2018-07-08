class Route
  attr_reader :StationS

  def initialize(departure, arrival)
    if departure.class == Station && arrival.class == Station
      @StationS = [departure, arrival]
    end
  end

  def station_add(station)
    if station.class == Station && !@StationS.include?(station)
      @StationS.insert(-2, station)
    end
  end

  def station_remove(station)
    if station.class == Station && @StationS.include?(station)
      @StationS.delete(station)
    end
  end

  def list
    print "Маршрут следования: "
    @StationS.each { |station| print "-[#{station.name}]-" }
  end
end
