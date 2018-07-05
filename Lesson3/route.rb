class Route
  attr_reader :route

  def initialize(departure, arrival)
    @route = [departure, arrival]
    puts "Маршрут со станции '#{departure}', до станции '#{arrival}' создан."
  end

  def station_add(transit_station)
    if @route.include?(transit_station)
      print "Такая станция уже есть в маршруте."
    else
      @route.insert(-2, transit_station)
      puts "Промежуточная станция '#{transit_station}' добавлена в маршут."
    end
  end

  def station_remove(remove_station)
    if @route.include?(remove_station)
      @route.delete(remove_station)
      puts "Станция '#{remove_station}' удалена из маршрута."
    else
      puts "Такой станции нет в машруте."
    end
  end

  def show
    print "Маршрут следования: "
    @route.each { |station_name| print "[#{station_name}]-" }
  end

end
