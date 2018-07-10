class Train
  attr_reader :type, :vagon_count, :speed, :number, :current_station, :previous_station,
  :next_station

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
    @speed -= value if speed >= value
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
      route.station_first.train_get(self)
    end
  end

  def current_station
    @route.stations[@index_station]
  end

  def next_station
    if route.stations[@index_station + 1] != @route.station_first
      @route.stations[@index_station + 1]
    end
  end

  def previous_station
    if @route.stations[@index_station - 1] != @route.station_last
      @route.stations[@index_station - 1]
    end
  end

  def move_forward
    @index_station += 1 if next_station != nil
  end

  def move_back
   @index_station -= 1 if previous_station != nil
  end
end
