class Train
  attr_reader :type, :vagon_count, :speed, :number

  def initialize(number, type, vagon_count)
    @number = number
    @type = type
    @vagon_count = vagon_count
    @speed = 0
  end

  def speed_up(value)
    @speed += value
  end

  def speed_down(value)
    if speed >= value
      @speed -= value
    elsif speed < value
      @speed = 0
    end
  end

  def vagon_add
    @vagon_count += 1 if speed == 0
  end

  def vagon_remove
    @vagon_count -= 1 if vagon_count > 0 && speed == 0
  end

  def route_add(route)
    if route.class == Route
      @route = route
      @index_station = 0
      route.first_station.train_get(self)
    end
  end

  def current_station
    @route.stations[@index_station]
  end

  def next_station
    if current_station != @route.last_station
      @route.stations[@index_station + 1]
    end
  end

  def previous_station
    if current_station != @route.first_station
      @route.stations[@index_station - 1]
    end
  end

  def move_forward
    if next_station != nil 
      @index_station += 1
      previous_station.train_send(self)
      current_station.train_get(self)
    end
  end

  def move_back
   if previous_station != nil
     @index_station -= 1 
     next_station.train_send(self)
     current_station.train_get(self)
   end
 end
end
