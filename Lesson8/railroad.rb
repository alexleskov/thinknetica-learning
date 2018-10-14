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
      abort if input.zero?
      menu_cases(input)
    end
  end

  # Нарушится принцип инкапсуляции.
  # При этом, нет необходимости, чтобы методы были доступны извне, в том числе и в подклассах этого класса.

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

  def request_object(object)
    case object
    when :train
      object_by_number(@interface.ask_train_number, trains)
    when :route
      object_by_name(@interface.ask_route_name, routes)
    when :station
      object_by_name(@interface.ask_station_name, stations)
    when :wagon
      object_by_number(@interface.ask_wagon_number, wagons)
    end
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
  rescue RuntimeError => e
    @interface.creating_error(e)
    retry
  end

  def create_train
    train_number = @interface.ask_train_number
    return @interface.error unless object_by_number(train_number, trains).nil?

    train_type = @interface.ask_train_type
    if train_type == :cargo
      @trains << new_train = CargoTrain.new(train_number)
    elsif train_type == :passenger
      @trains << new_train = PassengerTrain.new(train_number)
    end
    @interface.successful_creating
    @interface.train_data(new_train)
  rescue RuntimeError => e
    @interface.creating_error(e)
    retry
  end

  def create_route
    return object_list_by(:stations) if stations.empty? || stations.size < 2

    route_name = @interface.ask_route_name
    return @interface.error unless object_by_name(route_name, routes).nil?

    object_list_by(:stations)
    station_departure = object_by_name(@interface.ask_station_departure, stations)
    station_arrival = object_by_name(@interface.ask_station_arrival, stations)
    @routes << Route.new(route_name, station_departure, station_arrival)
    @interface.successful_creating
  rescue RuntimeError => e
    @interface.creating_error(e)
    retry
  end

  def create_wagon
    wagon_number = @interface.ask_wagon_number
    return @interface.error unless object_by_number(wagon_number, wagons).nil?

    wagon_type = @interface.ask_wagon_type
    if wagon_type == :cargo
      @wagons << CargoWagon.new(wagon_number, @interface.ask_wagon_volume)
    elsif wagon_type == :passenger
      @wagons << PassengerWagon.new(wagon_number, @interface.ask_wagon_seats)
    end
    @interface.successful_creating
  rescue RuntimeError => e
    @interface.creating_error(e)
    retry
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

  def data_for_route_actions
    return object_list_by(:routes), object_list_by(:stations) if routes.empty? || @stations.empty?

    object_list_by(:routes)
    route = request_object(:route)
    return @interface.error if route.nil?

    object_list_by(:stations)
    station = request_object(:station)
    return @interface.error if station.nil?

    { route: route, station: station }
  end

  def route_add_station
    data = data_for_route_actions
    return unless data.is_a?(Hash)

    result = data[:route].station_add(data[:station])
    check_result(result)
  end

  def route_remove_station
    data = data_for_route_actions
    return unless data.is_a?(Hash)

    result = data[:route].station_remove(data[:station])
    check_result(result)
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

    object_list_by(:trains)
    train = request_object(:train)
    return @interface.error if train.nil?

    speed_mode = @interface.ask_train_speed_mode
    speed_value = @interface.ask_train_speed_value
    if speed_mode == 1
      train.speed_up(speed_value)
    elsif speed_mode == 2
      train.speed_down(speed_value)
    end
    @interface.successful_action
  rescue RuntimeError => e
    @interface.action_error(e)
    retry
  end

  def train_change_station
    return @interface.trains_not_exist if trains.empty?

    object_list_by(:trains)
    train = request_object(:train)
    return @interface.error if train.nil?

    move_mode = @interface.ask_train_move_mode
    if move_mode == 1
      train.move_forward
    elsif move_mode == 2
      train.move_back
    end
    @interface.successful_action
  rescue RuntimeError => e
    @interface.action_error(e)
  end

  def train_add_route
    return object_list_by(:trains), object_list_by(:routes) if trains.empty? || @routes.empty?

    object_list_by(:trains)
    train = request_object(:train)
    return @interface.error if train.nil?

    object_list_by(:routes)
    route = request_object(:route)
    return @interface.error if route.nil?

    result = train.route_add(route)
    check_result(result)
  end

  def wagon_actions_menu(input)
    case input
    when 1
      wagon_connect_to
    when 2
      wagon_unconnect_from
    when 3
      fill_wagon
    else
      @interface.incorrect_choice
    end
  end

  def data_for_wagon_actions
    return object_list_by(:wagons), object_list_by(:trains) if wagons.empty? || trains.empty?

    object_list_by(:wagons)
    wagon = request_object(:wagon)
    return @interface.error if wagon.nil?

    object_list_by(:trains)
    train = request_object(:train)
    return @interface.error if train.nil?

    { train: train, wagon: wagon }
  end

  def wagon_connect_to
    data = data_for_wagon_actions
    return unless data.is_a?(Hash)

    data[:train].wagon_add(data[:wagon])
    @interface.successful_action
  rescue RuntimeError => e
    @interface.action_error(e)
  end

  def wagon_unconnect_from
    data = data_for_wagon_actions
    return unless data.is_a?(Hash)

    data[:train].wagon_remove(data[:wagon])
    @interface.successful_action
  rescue RuntimeError => e
    @interface.action_error(e)
  end

  def fill_wagon
    return object_list_by(:wagons) if wagons.empty?

    object_list_by(:wagons)
    wagon = request_object(:wagon)
    return @interface.error if wagon.nil?

    if wagon.type == :cargo
      wagon.to_fill(@interface.ask_wagon_change_volume)
    elsif wagon.type == :passenger
      wagon.to_fill
    end
    @interface.successful_action
    @interface.wagon_data(wagon)
  rescue RuntimeError => e
    @interface.action_error(e)
  end

  def lists_menu(input)
    case input
    when 1
      object_list_by(:stations)
    when 2
      trains_on_station_list
    when 3
      train_wagons_list
    else
      @interface.incorrect_choice
    end
  end

  def object_list_by(group_name)
    case group_name
    when :stations
      return @interface.stations_not_exist if @stations.empty?

      @interface.stations_list
      @stations.each { |station| @interface.station_name(station) }
    when :trains
      return @interface.trains_not_exist if @trains.empty?

      @interface.trains_list
      @trains.each { |train| @interface.train_data(train) }
    when :routes
      return @interface.routes_not_exist if @routes.empty?

      @interface.routes_list
      @routes.each { |route| @interface.route_name(route) }
    when :wagons
      return @interface.wagons_not_exist if @wagons.empty?

      @interface.wagons_list
      @wagons.each { |wagon| @interface.wagon_data(wagon) }
    end
  end

  def trains_on_station_list
    return @interface.stations_not_exist if @stations.empty?

    object_list_by(:stations)
    station = request_object(:station)
    return @interface.trains_not_exist if station.trains.empty?

    @interface.trains_list_station_name(station)
    station.station_trains ->(train) { @interface.train_data(train) }
  end

  def train_wagons_list
    return @interface.trains_not_exist if trains.empty?

    object_list_by(:trains)
    train = request_object(:train)
    return @interface.wagons_not_exist if train.wagons.empty?

    @interface.wagons_list_train_number(train)
    train.train_wagons ->(wagon) { @interface.wagon_data(wagon) }
  end
end
