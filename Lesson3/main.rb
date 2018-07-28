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
  attr_reader :input, :stations, :routes, :trains

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def menu
    @input = 0
    level_1
  end

  def choice
    loop do
      puts "\nУкажите цифру пункта нужного меню:"
      puts "-----------------------------------\n"
      @input = gets.to_i
      break if input > 0
    end
  end

  def level_1
    puts "\n                 МЕНЮ УПРАВЛЕНИЯ ВИРТУАЛЬНОЙ ЖЕЛЕЗНОЙ ДОРОГОЙ                "
    puts "-------------------------------------------------------------------------------"
    puts "| 1 - Создания объектов (Cтанция, Поезд, Маршрут, Вагон)                      |"
    puts "| 2 - Назначение объектов (Назначение маршрута, Добавить или Отцепить вагон)  |"
    puts "| 3 - Управление поездом (Установить скорость, Сменить станцию)               |"
    puts "| 4 - Просмотр списков (Список станций, Список поездов на станции)           |"
    puts "-------------------------------------------------------------------------------\n"
    choice
    level_1_cases
  end 


  def level_1_cases
    case input
      when 1
        puts "\nВыберите, что хотите создать:"
        puts "1 - Станция\n2 - Поезд\n3 - Маршрут\n4 - Вагон"
        choice
        level_1_1_cases
      when 2
        puts "\nВыберите, что хотите сделать:"
        puts "1 - Назначить маршрут\n2 - Добавить вагон\n3 - Отцепить вагон"
      when 3
        puts "\nВыберите, что хотите сделать:"
        puts "1 - Установить скорость\n2 - Сменить станцию"
      when 4
        puts "\nВыберите, что хотите сделать:"
        puts "1 - Отркыть список станций\n2 - Открыть список поездов на станции"
      else
        puts "\nТакого пункта меню не существует"
    end
  end

  def level_1_1_cases
    case input
      when 1
        level_1_1
      when 2
        level_1_2
      when 3
        level_1_3
      when 4
        level_1_4
    end
  end

  def level_1_1
    loop do
      puts "Введите название станции: "
      @station_name = gets.chomp
      break if @station_name.length > 0
    end
    return if stations.count { |station| station.name == @station_name } > 0
    stations << Station.new(@station_name)
  end

   def level_1_2
    loop do
      puts "Введите номер поезда: "
      @train_number = gets.to_i
      break if @train_number > 0
    end
    return if trains.count { |train| train.number == @train_number } > 0
    loop do
      puts "Введите тип поезда (cargo или passenger): "
      @train_type = gets.chomp.to_sym
      break if @train_type == :cargo || @train_type == :passenger
    end
    if @train_type == :cargo
      trains << CargoTrain.new(@train_number)
    elsif @train_type == :passenger
      trains << PassengerTrain.new(@train_number)
    end
  end
end