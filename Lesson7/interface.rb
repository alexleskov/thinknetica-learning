class Interface
  def main_menu
    puts "\n                 МЕНЮ УПРАВЛЕНИЯ ВИРТУАЛЬНОЙ ЖЕЛЕЗНОЙ ДОРОГОЙ                      "
    puts "-------------------------------------------------------------------------------------"
    puts "| 1 - Создания объектов (Cтанция, Поезд, Маршрут, Вагон)                            |"
    puts "| 2 - Управление маршрутом (Добавить станцию, Удалить станцию)                      |"
    puts "| 3 - Управление поездом (Установить скорость, Сменить станцию, Назначить маршрут)  |"
    puts "| 4 - Управление вагоном (Прицепить вагон, Отцепить вагон, Занять место\/объем)      |"
    puts "| 5 - Просмотр списков (Станции, Поезда на станции, Вагоны у поезда)                |"
    puts "-------------------------------------------------------------------------------------\n"
    puts "| 0 - Закрыть программу                                                             |\n"
    puts "-------------------------------------------------------------------------------------\n"    
  end

  def ask_choice
    loop do
      puts "\nУкажите цифру пункта нужного меню ('0' - назад/выход):"
      puts "-----------------------------------\n"
      input = gets.chomp
      break(input.to_i) if input.length > 0
    end
  end

  def ask_train_number
    loop do
      puts "\nВведите номер поезда: "
      train_number = gets.to_s
      break(train_number) if train_number.length > 0
    end
  end

  def ask_train_type
    loop do
      puts "\nВведите тип поезда (cargo или passenger): "
      train_type = gets.chomp.to_sym
      break(train_type) if train_type == :cargo || train_type == :passenger
    end
  end

  def ask_train_speed_mode
    loop do
      puts "\n1 - Ускорить поезд\n2 - Замедлить поезд"
      speed_mode = gets.to_i
      break(speed_mode) if speed_mode == 1 || speed_mode == 2
    end
  end

  def ask_train_speed_value
    loop do
      puts "\nВведите значение изменения скорости: "
      speed_value = gets.to_i
      break(speed_value) if speed_value != 0
    end
  end

  def ask_train_move_mode
    loop do
      puts "\n1 - Вперед на следующую станцию\n2 - Назад на предыдущую станцию"
      move_mode = gets.to_i
      break(move_mode) if move_mode == 1 || move_mode == 2
    end
  end

  def ask_route_name
    loop do
      puts "\nВведите название маршрута: "
      route_name = gets.chomp
      break(route_name) if route_name.length > 0
    end
  end

  def ask_station_departure
    loop do
      puts "\nВведите название начальной станции: "
      station_departure_name = gets.chomp
      break(station_departure_name) if station_departure_name.length > 0
    end
  end

  def ask_station_arrival
    loop do
      puts "\nВведите название конечной станции: "
      station_arrival_name = gets.chomp
      break(station_arrival_name) if station_arrival_name.length > 0
    end
  end

  def ask_station_name
    loop do
      puts "\nВведите название станции: "
      station_name = gets.chomp
      break(station_name) if station_name.length > 0
    end
  end

  def ask_wagon_number
    loop do
      puts "\nВведите номер вагона: "
      wagon_number = gets.to_i
      break(wagon_number) if wagon_number > 0
    end
  end

  def ask_wagon_type
    loop do
      puts "\nВведите тип вагона (cargo или passenger): "
      wagon_type = gets.chomp.to_sym
      break(wagon_type) if wagon_type == :cargo || wagon_type == :passenger
    end
  end

  def ask_wagon_seats
    loop do
      puts "\nВведите количество мест в вагоне: "
      wagon_seats = gets.to_i
      break(wagon_seats) if wagon_seats > 0
    end
  end

  def ask_wagon_volume
    loop do
      puts "\nВведите вмещаемый объем вагона: "
      wagon_volume = gets.to_i
      break(wagon_volume) if wagon_volume > 0
    end    
  end

  def ask_wagon_change_volume
    loop do
      puts "\nВведите значение заполнения объема для вагона: "
      wagon_volume = gets.to_i
      break(wagon_volume) if wagon_volume > 0
    end
  end

  def ask_wagon_change_seats
    loop do
      puts "\nВведите количество занятых мест в вагоне: "
      wagon_seats = gets.to_i
      break(wagon_seats) if wagon_seats > 0
    end
  end

  def wagons_list_train_number(train)
    puts "\nСписок вагонов у поезда с номером #{train.number}\n"
  end

  def wagon_data(wagon)
    attributes = {}
    if wagon.type == :cargo
      attributes["свободный объем"] = [wagon.volume]
      attributes["занятый объем"] = [wagon.occupied_volume]
    elsif wagon.type == :passenger
      attributes["свободные места"] = [wagon.seats]
      attributes["занятые места"] = [wagon.occupied_seats]
    end
    print " Номер вагона: #{wagon.number}, тип вагона: #{wagon.type}, "
    attributes.each { |attribute, value| print "#{attribute}: #{value}, " }
    puts "\n--------------------------------------------------------------------------\n"    
  end

  def wagons_not_exist
    puts "\n[Ещё нет ни одного вагона]\n"
  end

  def wagons_list
    puts "\nСписок вагонов\n"
  end

  def route_name(route)
    puts "#{route.name}"
  end

  def routes_not_exist
    puts "\n[Ещё нет ни одного маршрута]\n"
  end

  def routes_list
    puts "\nСписок маршрутов\n"
  end

  def station_name(station)
    puts "#{station.name}"
  end

  def stations_not_exist
    puts "\n[Ещё нет ни одной станции]\n"
  end

  def stations_list
    puts "\nСписок станций\n"
  end

  def trains_list_station_name(station)
    puts "\nСписок поездов на станции #{station.name}\n"
  end

  def train_data(train)
    puts " Номер поезда: #{train.number} Тип поезда: #{train.type}"
    puts "-----------------------------------------------\n"    
  end

  def trains_not_exist
     puts "\n[Ещё нет ни одного поезда]\n"   
  end

  def trains_list
    puts "\nСписок поездов\n"
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
    puts "1 - Прицепить вагон\n2 - Отцепить вагон\n3 - Занять место\/объем" 
  end

  def lists_menu
    puts "\nВыберите, что хотите сделать:"
    puts "1 - Посмотреть список станций\n2 - Посмотреть список поездов на станции\n3 - Посмотреть список вагонов у поезда"
  end

  def incorrect_choice
    puts "\n[Такого пункта меню нет]\n"
  end

  def successful_creating
    puts "\n[Успешно создано]\n"
  end

  def successful_action
    puts "\n[Успешно]\n"
  end

  def error
    puts "\n[ОШИБКА: Введнные данные некорректны]\n"
  end

  def creating_error(e)
    puts "\nПри создании объекта возникла ошибка. Попробуйте еще раз."
    puts e.inspect
  end

  def action_error(e)
    puts "\nПри проведении действий с объектом возникла ошибка. Попробуйте еще раз."
    puts e.inspect
  end
end
