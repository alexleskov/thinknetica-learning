require_relative 'company_name.rb'
require_relative 'instance_counter.rb'

class Train
  include CompanyName
  include InstanceCounter

  @@all = []

  def self.find(train_number)
    index = @@all.index { |object| object.number == train_number }
    return if index.nil?
    @@all[index] 
  end

  attr_reader :type, :speed, :number, :wagons

  def initialize(number, type)
    register_instance
    @number = number
    @speed = 0
    @wagons = []
    @type = type
    @@all << self
  end

  def speed_up(value)
    @speed += value
  end

  def speed_down(value)
    if speed >= value
      @speed -= value
    else
      @speed = 0
    end
  end

  def wagon_add(wagon)
    return if @wagons.include?(wagon) || wagon.current_train
    if speed == 0
      @wagons << wagon
      wagon.set_current_train(self)
    end
  end

  def wagon_remove(wagon)
    return unless @wagons.include?(wagon)
    if speed == 0
      @wagons.delete(wagon)
      wagon.set_current_train(nil)
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
