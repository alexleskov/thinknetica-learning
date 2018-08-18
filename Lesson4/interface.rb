class Interface

  def main_menu
    puts "\n                 МЕНЮ УПРАВЛЕНИЯ ВИРТУАЛЬНОЙ ЖЕЛЕЗНОЙ ДОРОГОЙ                      "
    puts "-------------------------------------------------------------------------------------"
    puts "| 1 - Создания объектов (Cтанция, Поезд, Маршрут, Вагон)                            |"
    puts "| 2 - Управление маршрутом (Добавить станцию, Удалить станцию)                      |"
    puts "| 3 - Управление поездом (Установить скорость, Сменить станцию, Назначить маршрут)  |"
    puts "| 4 - Управление вагоном (Прицепить вагон, Отцепить вагон)                          |"
    puts "| 5 - Просмотр списков (Список станций, Список поездов на станции)                  |"
    puts "-------------------------------------------------------------------------------------\n"
    puts "| 0 - Закрыть программу                                                             |\n"
    puts "-------------------------------------------------------------------------------------\n"    
  end

  def ask_choice
    puts "\nУкажите цифру пункта нужного меню ('0' - назад/выход):"
    puts "-----------------------------------\n"
    i = gets.chomp
  end

  def ask_train_number
    loop do
      puts "\nВведите номер поезда: "
      @train_number = gets.to_i
      break if @train_number > 0
    end
    @train_number
  end

  def ask_train_type
    loop do
      puts "\nВведите тип поезда (cargo или passenger): "
      @train_type = gets.chomp.to_sym
      break if @train_type == :cargo || @train_type == :passenger
    end
    @train_type
  end

  def ask_train_speed_mode
    loop do
      puts "\n1 - Ускорить поезд\n2 - Замедлить поезд"
      @speed_mode = gets.to_i
    break if @speed_mode == 1 || @speed_mode == 2
    end
    @speed_mode    
  end

  def ask_train_speed_value
    loop do
      puts "\nВведите значение изменения скорости: "
      @speed_value = gets.to_i
      break if @speed_value != 0
    end
    @speed_value
  end

  def ask_train_move_mode
    loop do
      puts "\n1 - Вперед на следующую станцию\n2 - Назад на предыдущую станцию"
      @move_mode = gets.to_i
      break if @move_mode == 1 || @move_mode == 2
    end
    @move_mode
  end

  def trains_list_station_name(station)
    puts "\nСписок поездов на станции #{station.name}:\n"
  end

  def trains_list_on_station(train)
    puts " Номер поезда: #{train.number}, тип поезда: #{train.type}"
    puts "-----------------------------------------------\n"    
  end

  def ask_route_name
    loop do
      puts "\nВведите название маршрута: "
      @route_name = gets.chomp
      break if @route_name.length > 0
    end
    @route_name
  end

  def ask_station_departure
    loop do
      puts "\nВведите название начальной станции: "
      @station_departure_name = gets.chomp
      break if @station_departure_name.length > 0
    end
    @station_departure_name
  end

  def ask_station_arrival
    loop do
      puts "\nВведите название конечной станции: "
      @station_arrival_name = gets.chomp
      break if @station_arrival_name.length > 0
    end
    @station_arrival_name
  end

  def ask_station_name
    loop do
      puts "\nВведите название станции: "
      @station_name = gets.chomp
      break if @station_name.length > 0
    end
    @station_name
  end

  def station_name(station)
    puts "\n[#{station.name}]"
  end

  def stations_not_exist
    puts "\nЕщё нет ни одной станции"
  end

  def stations_list
    puts "\nСписок станций:"
  end

  def ask_wagon_number
    loop do
      puts "\nВведите номер вагона: "
      @wagon_number = gets.to_i
      break if @wagon_number > 0
    end
    @wagon_number
  end

  def ask_wagon_type
    loop do
      puts "\nВведите тип вагона (cargo или passenger): "
      @wagon_type = gets.chomp.to_sym
      break if @wagon_type == :cargo || @wagon_type == :passenger
    end
    @wagon_type
  end

  def creation_menu
    puts "\nВыберите, что хотите создать:"
    puts "1 - Станция\n2 - Поезд\n3 - Маршрут\n4 - Вагон"
  end

  def route_actions_menu
    puts "\nВыберите, что хотите сделать с маршрутом:"
    puts "\n1 - Добавить станцию\n2 - Удалить станцию"
  end

  def train_actions_menu
    puts "\nВыберите, что хотите сделать с поездом:"
    puts "1 - Установить скорость\n2 - Переместиться на станцию\n3 - Назначить маршрут" 
  end

  def wagon_actions_menu
    puts "\nВыберите, что хотите сделать с вагоном:"
    puts "1 - Прицепить вагон\n2 - Отцепить вагон" 
  end

  def lists_menu
    puts "\nВыберите, что хотите сделать:"
    puts "1 - Посмотреть список станций\n2 - Посмотреть список поездов на станции"
  end

  def incorrect_choice
    puts "\nТакого пункта меню нет"
  end

  def successful_creating
    puts "\nУспешно создано"
  end

  def successful_action
    puts "Успешно"
  end

end