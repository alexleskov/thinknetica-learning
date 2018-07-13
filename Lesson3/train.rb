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
    elsif
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
    if route.instance_of?(Route)
      @route = route
      @index_station = 0
      @route.first_station.train_get(self)
    end
  end

  def current_station
    @route.stations[@index_station]
  end

  def next_station
    @route.stations[@index_station + 1] if current_station != @route.last_station
  end

  def previous_station
    @route.stations[@index_station - 1] if current_station != @route.first_station
  end

  def move_forward
    if next_station
      current_station.train_send(self)
      next_station.train_get(self)
      @index_station += 1
    end
  end

  def move_back
   if previous_station
     current_station.train_send(self)
     previous_station.train_get(self)
     @index_station -= 1 
   end
 end
end
