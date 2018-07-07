class Route
  attr_reader :route

  def initialize(departure, arrival)
    if departure.class == Station && arrival.class == Station
      @departure = departure.name
      @arrival = arrival.name
      @route = [@departure, @arrival]
      puts "Маршрут со станции '#{@departure}', до станции '#{@arrival}' создан."
    else
      puts "Ошибка. Введённые данные не являются станцией."
    end
  end

  def station_add(transit_station)
    if transit_station.class == Station && !@route.include?(transit_station.name)
      @transit_station = transit_station.name
      @route.insert(-2, @transit_station)
      puts "Промежуточная станция '#{@transit_station}' добавлена в маршут."
    else
      print "Эта станция уже есть, либо введены неверные данные."
    end
  end

  def station_remove(remove_station)
    if remove_station.class == Station && @route.include?(remove_station.name)
      @remove_station = remove_station.name
      @route.delete(@remove_station)
      puts "Станция '#{@remove_station}' удалена из маршрута."
    else
      puts "Этой станции нет, либо введены неверные данные."
    end
  end

  def list
    print "Маршрут следования: "
    @route.each { |station_name| print "[#{station_name}]-" }
  end
end
