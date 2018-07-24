class Train
  attr_reader :type, :speed, :number, :vagons

  def initialize(number)
    @number = number
    @speed = 0
    @vagons = []
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

  def vagon_add(vagon)
    return if @vagons.include?(vagon) && !vagon.current_train.nil? && !vagon.is_a?(Vagon)
    if speed == 0 && self.type == vagon.type
      @vagons << vagon
      vagon.connect_to(self)
    end
  end

  def vagon_remove(vagon)
    return unless @vagons.include?(vagon)
    if speed == 0
      @vagons.delete(vagon)
      vagon.unconnect_from(self)
    end
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

  protected

  # Оба метода ниже предназначены только для корректной работы методов move_forward и move_back.
  # Нарушится принцип инкапсуляции.
  # Если использовать их в отдельности извне, то это приведет к серьезным ошибкам в программе:
  # изменится значение станции следующий\предыдущей станции в маршруте у объекта поезда,
  # но при этом поезд не переместится в соответствующий объект станции, - а оно нам надо?
  # Потом еще с транспортной полицией разбираться, что этот поезд тут забыл и по судам затаскают.
  # protected - потому что должно использоваться в подклассах.

  def next_station
    @route.stations[@index_station + 1] if current_station != @route.last_station
  end

  def previous_station
    @route.stations[@index_station - 1] if current_station != @route.first_station
  end

end
