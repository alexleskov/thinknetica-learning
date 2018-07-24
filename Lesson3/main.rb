require_relative 'route.rb'
require_relative 'station.rb'
require_relative 'train.rb'
require_relative 'train_cargo.rb'
require_relative 'train_passenger.rb'
require_relative 'vagon.rb'
require_relative 'vagon_cargo.rb'
require_relative 'vagon_passenger.rb'

puts "Ваша личная виртуальная железная дорога загружена. С чего начнем?\n "

module Menu
  module_function
  def input; @input end
  def input= number; @input= number end

  def self.show
    level1_menu
  end

  def self.choice
      puts "\nУкажите цифру пункта нужного меню:"
      puts "-----------------------------------\n"
      self.input = gets.to_i  
  end

  def self.level1_menu  
    puts "\n                 МЕНЮ УПРАВЛЕНИЯ ВИРТУАЛЬНОЙ ЖЕЛЕЗНОЙ ДОРОГОЙ                "
    puts "-------------------------------------------------------------------------------"
    puts "| 1 - Создания объектов (Cтанция, Поезд, Маршрут, Вагон)                      |"
    puts "| 2 - Назначение объектов (Назначение маршрута, Добавить или Отцепить вагон)  |"
    puts "| 3 - Управление поездом (Установить скорость, Сменить станцию)               |"
    puts "| 4 - Просмотр списоков (Список станций, Список поездов на станции)           |"
    puts "-------------------------------------------------------------------------------"
    puts "|              Чтобы открыть меню заново, введите: Menu.show                  |"
    puts "-------------------------------------------------------------------------------\n"
    loop do
      choice
      break level1_cases if self.input > 0
    end
  end

  def self.level1_cases
    case @input
      when 1
        puts "\nВыберите, что хотите создать:"
        puts "1 - Станция\n2 - Поезд\n3 - Маршрут\n4 - Вагон"
        choice
      when 2
        puts "\nВыберите, что хотите сделать:"
        puts "1 - Назначить маршрут\n2 - Добавить вагон\n3 - Отцепить вагон"
      else
        puts "\nТакого пункта меню не существует"
    end
  end

Menu.show

end
