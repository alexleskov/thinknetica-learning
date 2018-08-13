require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'train_cargo.rb'
require_relative 'train_passenger.rb'
require_relative 'wagon.rb'
require_relative 'wagon_cargo.rb'
require_relative 'wagon_passenger.rb'

puts "Ваша личная виртуальная железная дорога загружена. С чего начнем?\n "


class RailRoad
  attr_reader :input, :stations, :routes, :trains, :wagons

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def menu
    puts "\n                 МЕНЮ УПРАВЛЕНИЯ ВИРТУАЛЬНОЙ ЖЕЛЕЗНОЙ ДОРОГОЙ                      "
    puts "-------------------------------------------------------------------------------------"
    puts "| 1 - Создания объектов (Cтанция, Поезд, Маршрут, Вагон)                            |"
    puts "| 2 - Управление маршрутом (Добавить станцию, Удалить станцию)                      |"
    puts "| 3 - Управление поездом (Установить скорость, Сменить станцию, Назначить маршрут)  |"
    puts "| 4 - Управление вагоном (Прицепить вагон, Отцепить вагон)                          |"
    puts "| 5 - Просмотр списков (Список станций, Список поездов на станции)                  |"
    puts "------------------------------------------------------------------------------------\n"
    @input = 0
    choice
    menu_cases
  end 

  #Нарушится принцип инкапсуляции.
  #При этом, нет необходимости, чтобы методы были доступны извне, в том числе и в подклассах этого класса.

  private

  def choice
    loop do
      puts "\nУкажите цифру пункта нужного меню ('стоп' - чтобы выйти):"
      puts "-----------------------------------\n"
      @input = gets.chomp
      break if input.length > 0
    end
    @input = input.to_i
    puts "\nВы вышли из меню" if input == 0 
  end

  def object_by_name(initial_object,array)
    index = array.index { |object_in_array| object_in_array.name == initial_object }
    return if index.nil?
    array[index] 
  end

  def object_by_number(initial_object,array)
    index = array.index { |object_in_array| object_in_array.number == initial_object }
    return if index.nil?
    array[index] 
  end

  def request_train
    loop do
      puts "\nВведите номер поезда: "
      @train_number = gets.to_i
      break if @train_number > 0
    end
    @train = object_by_number(@train_number,trains)
    return if @train.nil?
  end

  def request_route
    loop do
      puts "\nВведите название маршрута: "
      @route_name = gets.chomp
      break if @route_name.length > 0
    end
    @route = object_by_name(@route_name,routes)
    return if @route.nil?    
  end

  def request_station
    loop do
      puts "\nВведите название станции: "
      @station_name = gets.chomp
      break if @station_name.length > 0
    end
    @station = object_by_name(@station_name,stations)
    return if @station.nil?
  end

  def request_wagon
    loop do
      puts "\nВведите номер вагона: "
      @wagon_number = gets.to_i
      break if @wagon_number > 0
    end
    @wagon = object_by_number(@wagon_number,wagons)
    return if @wagon.nil?     
  end

  def menu_cases
    case input
      when 0
      when 1
        puts "\nВыберите, что хотите создать:"
        puts "1 - Станция\n2 - Поезд\n3 - Маршрут\n4 - Вагон"
        choice
        level_1_cases
      when 2
        puts "\nВыберите, что хотите сделать с маршрутом:"
        puts "\n1 - Добавить станцию\n2 - Удалить станцию"
        choice
        level_2_cases
      when 3
        puts "\nВыберите, что хотите сделать с поездом:"
        puts "1 - Установить скорость\n2 - Переместиться на станцию\n3 - Назначить маршрут" 
        choice
        level_3_cases
      when 4
        puts "\nВыберите, что хотите сделать с вагоном:"
        puts "1 - Прицепить вагон\n2 - Отцепить вагон" 
        choice
        level_4_cases
      when 5
        puts "\nВыберите, что хотите сделать:"
        puts "1 - Посмотреть список станций\n2 - Посмотреть список поездов на станции"
        choice
        level_5_cases
      else
        puts "\nТакого пункта меня нет"
    end
  end

  def level_1_cases
    case input
      when 0
      when 1
        level_1_1
      when 2
        level_1_2
      when 3
        level_1_3
      when 4
        level_1_4
      else
        puts "\nТакого пункта меня нет"
    end
  end

  def level_1_1
    loop do
      puts "\nВведите название станции: "
      @station_name = gets.chomp
      break if @station_name.length > 0
    end
    return unless object_by_name(@station_name,stations).nil?
    stations << Station.new(@station_name)
  end

  def level_1_2
    loop do
      puts "\nВведите номер поезда: "
      @train_number = gets.to_i
      break if @train_number > 0
    end
    return unless object_by_number(@train_number,trains).nil?
    loop do
      puts "\nВведите тип поезда (cargo или passenger): "
      @train_type = gets.chomp.to_sym
      break if @train_type == :cargo || @train_type == :passenger
    end
    if @train_type == :cargo
      trains << CargoTrain.new(@train_number)
    elsif @train_type == :passenger
      trains << PassengerTrain.new(@train_number)
    end
  end

  def level_1_3
    loop do
      puts "\nВведите название маршрута: "
      @route_name = gets.chomp
      break if @route_name.length > 0
    end
    loop do
      puts "\nВведите название начальной станции: "
      @station_departure_name = gets.chomp
      break if @station_departure_name.length > 0
    end
    @station_departure = object_by_name(@station_departure_name,stations)
    return if @station_departure.nil?
    loop do
      puts "\nВведите название конечной станции: "
      @station_arrival_name = gets.chomp
      break if @station_arrival_name.length > 0
    end
    @station_arrival = object_by_name(@station_arrival_name,stations)
    return if @station_arrival.nil?
    routes << Route.new(@route_name, @station_departure, @station_arrival)
  end

  def level_1_4
    loop do
      puts "\nВведите номер вагона: "
      @wagon_number = gets.to_i
      break if @wagon_number > 0
    end
    return unless object_by_number(@wagon_number,wagons).nil?
    loop do
      puts "\nВведите тип вагона (cargo или passenger): "
      @wagon_type = gets.chomp.to_sym
      break if @wagon_type == :cargo || @wagon_type == :passenger
    end
    if @wagon_type == :cargo
      wagons << CargoWagon.new(@wagon_number)
    elsif @wagon_type == :passenger
      wagons << PassengerWagon.new(@wagon_number)
    end
  end

  def level_2_cases
    case input
      when 0
      when 1
        level_2_1
      when 2
        level_2_2
      else
        puts "\nТакого пункта меня нет"
    end
  end

  def level_2_1
    request_route
    request_station
    @route.station_add(@station)
  end

  def level_2_2
    request_route
    request_station
    @route.station_remove(@station)    
  end

  def level_3_cases
    case input
      when 0
      when 1
        level_3_1
      when 2
        level_3_2
      when 3
        level_3_3
      else
        puts "\nТакого пункта меня нет"
    end
  end

  def level_3_1
    request_train
    loop do
      puts "\n1 - Ускорить поезд\n2 - Замедлить поезд"
      @speed_mode = gets.to_i
    break if @speed_mode == 1 || @speed_mode == 2
    end
    loop do
      puts "\nВведите значение изменения скорости: "
      @speed_value = gets.to_i
    break if @speed_value != 0
    end
    if @speed_mode == 1
      @train.speed_up(@speed_value)
    elsif @speed_mode == 2
      @train.speed_down(@speed_value)
    end
  end

  def level_3_2
    request_train
    loop do
      puts "\n1 - Вперед на следующую станцию\n2 - Назад на предыдущую станцию"
      @move_mode = gets.to_i
    break if @move_mode == 1 || @move_mode == 2
    end
    if @move_mode == 1
      @train.move_forward
    elsif @move_mode == 2
      @train.move_back
    end      
  end

  def level_3_3
    request_train
    request_route
    @train.route_add(@route)    
  end

  def level_4_cases
    case input
      when 0
      when 1
        level_4_1
      when 2
        level_4_2
      else
        puts "\nТакого пункта меня нет"
    end    
  end

  def level_4_1
    request_wagon
    request_train
    @wagon.connect_to(@train)
  end

  def level_4_2
    request_wagon
    request_train
    @wagon.unconnect_from(@train)
  end

  def level_5_cases
    case input
      when 0
      when 1
        level_5_1
      when 2
        level_5_2
      else
        puts "\nТакого пункта меня нет"
    end    
  end

  def level_5_1
    @stations.each do |station|
      puts "[#{station.name}]"
    end
  end

  def level_5_2
    request_station
    return if @station.trains.empty?
    puts "\nСписок поездов на станции #{@station.name}:\n"
    @station.trains.each do |train|
      puts " Номер поезда: #{train.number}\n Тип поезда: #{train.type}"
      puts "----------------------------------------------------------\n"
    end
  end

end