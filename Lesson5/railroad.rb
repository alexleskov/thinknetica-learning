class RailRoad
  attr_reader :stations, :routes, :trains, :wagons

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
    @interface = Interface.new
  end

  def menu
    loop do
      @interface.main_menu
      input = choice
      abort if input == 0
      menu_cases(input)
    end
  end

  #Нарушится принцип инкапсуляции.
  #При этом, нет необходимости, чтобы методы были доступны извне, в том числе и в подклассах этого класса.

  private

  def choice
    @interface.ask_choice
  end

  def object_by_name(initial_object, array)
    index = array.index { |object| object.name == initial_object }
    return if index.nil?
    array[index] 
  end

  def object_by_number(initial_object, array)
    index = array.index { |object| object.number == initial_object }
    return if index.nil?
    array[index] 
  end

  def check_result(result)
    if result
      @interface.successful_action
    else
      @interface.error
    end
  end

  def request_train
    train_number = @interface.ask_train_number
    train = object_by_number(train_number, trains)
    return if train.nil?
    train
  end

  def request_route
    route_name = @interface.ask_route_name
    route = object_by_name(route_name, routes)
    return if route.nil?
    route    
  end

  def request_station
    station_name = @interface.ask_station_name
    station = object_by_name(station_name, stations)
    return if station.nil?
    station
  end

  def request_wagon
    wagon_number = @interface.ask_wagon_number
    wagon = object_by_number(wagon_number, wagons)
    return if wagon.nil?     
    wagon
  end

  def menu_cases(input) 
    case input
    when 1
      @interface.creation_menu
      creation_menu(choice)
    when 2
      @interface.route_actions_menu
      route_actions_menu(choice)
    when 3
      @interface.train_actions_menu
      train_actions_menu(choice)
    when 4
      @interface.wagon_actions_menu
      wagon_actions_menu(choice)
    when 5
      @interface.lists_menu
      lists_menu(choice)
    else
      @interface.incorrect_choice
    end
  end

  def creation_menu(input)
    case input
    when 1
      create_station
    when 2
      create_train
    when 3
      create_route
    when 4
      create_wagon
    else
      @interface.incorrect_choice
    end
  end

  def create_station
    station_name = @interface.ask_station_name
    return @interface.error unless object_by_name(station_name, stations).nil?
    @stations << Station.new(station_name)
    @interface.successful_creating
  end

  def create_train
    train_number = @interface.ask_train_number
    return @interface.error unless object_by_number(train_number, trains).nil?
    train_type = @interface.ask_train_type
    if train_type == :cargo
      @trains << CargoTrain.new(train_number)
      @interface.successful_creating
    elsif train_type == :passenger
      @trains << PassengerTrain.new(train_number)
      @interface.successful_creating
    end
  end

  def create_route
    return stations_list if stations.empty? || stations.size < 2
    route_name = @interface.ask_route_name
    return @interface.error unless object_by_name(route_name, routes).nil?
    stations_list
    station_departure_name = @interface.ask_station_departure
    station_departure = object_by_name(station_departure_name, stations)
    return @interface.error if station_departure.nil?
    station_arrival_name = @interface.ask_station_arrival
    station_arrival = object_by_name(station_arrival_name, stations)
    return @interface.error if station_arrival.nil?
    @routes << Route.new(route_name, station_departure, station_arrival)
    @interface.successful_creating
  end

  def create_wagon
    wagon_number = @interface.ask_wagon_number
    return @interface.error unless object_by_number(wagon_number, wagons).nil?
    wagon_type = @interface.ask_wagon_type
    if wagon_type == :cargo
      @wagons << CargoWagon.new(wagon_number)
      @interface.successful_creating
    elsif wagon_type == :passenger
      @wagons << PassengerWagon.new(wagon_number)
      @interface.successful_creating
    end
  end

  def route_actions_menu(input)
    case input
    when 1
      route_add_station
    when 2
      route_remove_station
    else
      @interface.incorrect_choice
    end
  end

  def route_add_station
    if routes.empty? || @stations.empty?
      routes_list
      stations_list
    else
      routes_list
      route = request_route
      stations_list
      station = request_station
      return @interface.error if route.nil? || station.nil?
      result = route.station_add(station)
      check_result(result)
    end
  end

  def route_remove_station
    if routes.empty? || @stations.empty?
      routes_list
      stations_list
    else
      routes_list
      route = request_route
      stations_list
      station = request_station
      return @interface.error if route.nil? || station.nil?
      result = route.station_remove(station)
      check_result(result)
    end
  end

  def train_actions_menu(input)
    case input
    when 1
      train_change_speed
    when 2
      train_change_station
    when 3
      train_add_route
    else
      @interface.incorrect_choice
    end
  end

  def train_change_speed
    return @interface.trains_not_exist if trains.empty?
    trains_list
    train = request_train
    return @interface.error if train.nil?
    speed_mode = @interface.ask_train_speed_mode
    speed_value = @interface.ask_train_speed_value
    if speed_mode == 1
      train.speed_up(speed_value)
      @interface.successful_action
    elsif speed_mode == 2
      train.speed_down(speed_value)
      @interface.successful_action
    end
  end

  def train_change_station
    return @interface.trains_not_exist if trains.empty?
    trains_list
    train = request_train
    return @interface.error if train.nil?
    move_mode = @interface.ask_train_move_mode
    if move_mode == 1
      train.move_forward
      @interface.successful_action
    elsif move_mode == 2
      train.move_back
      @interface.successful_action
    end      
  end

  def train_add_route
    if trains.empty? || @routes.empty?
      trains_list
      routes_list
    else
      trains_list
      train = request_train
      routes_list
      route = request_route
      return @interface.error if train.nil? || route.nil?
      result = train.route_add(route)
      check_result(result)
    end
  end

  def wagon_actions_menu(input)
    case input
    when 1
      wagon_connect_to
    when 2
      wagon_unconnect_from
    else
      @interface.incorrect_choice
    end    
  end

  def wagon_connect_to
    if wagons.empty? || @trains.empty?
      wagons_list
      trains_list
    else
      wagons_list
      wagon = request_wagon
      trains_list
      train = request_train
      return @interface.error if wagon.nil? || train.nil?
      result = train.wagon_add(wagon)
      check_result(result)
    end
  end

  def wagon_unconnect_from
    if wagons.empty? || @trains.empty?
      wagons_list
      trains_list
    else
      wagons_list
      wagon = request_wagon
      trains_list
      train = request_train
      return @interface.error if wagon.nil? || train.nil?
      result = train.wagon_remove(wagon)
      check_result(result)
    end
  end

  def lists_menu(input)
    case input
    when 1
      stations_list
    when 2
      trains_on_station_list
    else
      @interface.incorrect_choice
    end    
  end

  def stations_list
    return @interface.stations_not_exist if @stations.empty?
    @interface.stations_list
    @stations.each { |station| @interface.station_name(station) }
  end

  def trains_list
    return @interface.trains_not_exist if @trains.empty?
    @interface.trains_list
    @trains.each { |train| @interface.train_data(train) }
  end

  def routes_list
    return @interface.routes_not_exist if @routes.empty?
    @interface.routes_list
    @routes.each { |route| @interface.route_name(route) }    
  end

  def wagons_list
    return @interface.wagons_not_exist if @wagons.empty?
    @interface.wagons_list
    @wagons.each { |wagon| @interface.wagon_data(wagon) }    
  end

  def trains_on_station_list
    return @interface.stations_not_exist if @stations.empty?
    stations_list
    station = request_station
    return @interface.trains_not_exist if station.trains.empty?
    @interface.trains_list_station_name(station)
    station.trains.each { |train| @interface.train_data(train) }
  end
end
