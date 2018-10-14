require_relative 'company_name.rb'
require_relative 'instance_counter.rb'
require_relative 'validation.rb'

class Train
  include CompanyName
  include InstanceCounter
  include Validation

  NUMBER_FORMAT = /^[a-zA-Z\d]{3}-?[a-zA-Z\d]{2}$/

  class << self
    attr_reader :all
  end

  @all = {}

  def self.find(train_number)
    all[train_number]
  end

  attr_reader :type, :speed, :number, :wagons

  def initialize(number, type)
    @number = number
    @speed = 0
    @wagons = []
    @type = type
    validate!
    self.class.all[number] = self
    register_instance
  end

  def validate!
    raise "Необходимо указать номер для поезда" if number.nil?
    raise "Необходимо указать корректный формат для номера поезда" if number !~ NUMBER_FORMAT
    raise "Необходимо указать верный тип для поезда: cargo или passenger" unless %i[cargo passenger].include?(type)
  end

  def speed_up(value)
    raise "Значение изменения скорости должно быть больше нуля" if value <= 0

    @speed += value
  end

  def speed_down(value)
    raise "Значение изменения скорости должно быть больше нуля" if value <= 0

    if speed >= value
      @speed -= value
    else
      @speed = 0
    end
  end

  def wagon_add(wagon)
    raise "Выбранный вагон уже прицеплен к поезду" if @wagons.include?(wagon) || wagon.current_train
    raise "Поезд двигается, прицепить вагон нельзя. Скорость поезда: #{speed}" unless speed.zero?

    @wagons << wagon
    wagon.set_current_train(self)
  end

  def wagon_remove(wagon)
    raise "Выбранный вагон итак не прицеплен к поезду" unless @wagons.include?(wagon)
    raise "Поезд двигается, отцепить вагон нельзя. Скорость поезда: #{speed}" unless speed.zero?

    @wagons.delete(wagon)
    wagon.set_current_train(nil)
  end

  def route_add(route)
    return unless route.instance_of?(Route)

    @route = route
    @index_station = 0
    @route.first_station.train_get(self)
  end

  def current_station
    @route.stations[@index_station]
  end

  def move_forward
    raise "Достигнута конечная станция" unless next_station

    next_station
    current_station.train_send(self)
    next_station.train_get(self)
    @index_station += 1
  end

  def move_back
    raise "Достигнута конечная станция" unless previous_station

    current_station.train_send(self)
    previous_station.train_get(self)
    @index_station -= 1
  end

  def train_wagons(block)
    wagons.each { |wagon| block.call(wagon) }
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
