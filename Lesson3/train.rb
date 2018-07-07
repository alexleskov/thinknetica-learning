class Train
  attr_accessor(:number, :speed)
  attr_reader :type
  attr_reader :vagon_count

  def initialize(number, type, vagon_count, speed = 0)
    @number = number
    @type = type
    @vagon_count = vagon_count
    @speed = speed
  end

  def stop
    @speed = 0
    puts "Поезд с номером '#{@number}' остановлен. Скорость: #{@speed}."
  end

  def vagon_add
    if @speed == 0
      @vagon_count += 1
      puts "К поезду с номером '#{@number}' добавлен ещё один вагон. Всего вагонов прицеплено: #{@vagon_count}."
    else
      puts "Поезд движется, нельзя прицепить вагон."
    end
  end

  def vagon_remove
    if @vagon_count == 0 || @speed > 0
      puts "Нельзя отцепить вагон."
    else
      @vagon_count -= 1
      puts "У поезда с номером '#{@number}' отцеплён вагон. Всего вагонов прицеплено: #{@vagon_count}."
    end
  end

  def list
    if @route_add != nil
      puts "Маршрут поезда с номером '#{@number}': #{@route_add.route}."
      puts "Предыдущая станция: '#{@previous_station}'. Текущая станция: '#{@current_station}'. Следующая станция: '#{@next_station}'."
    end
  end

  def route_add=(route_add)
    if route_add.class == Route
      @route_add = route_add
      @current_station_index = 0
      @current_station = @route_add.route[0]
      @next_station = @route_add.route[1]
      @previous_station = @route_add.route[-1]
      puts "Маршрут #{@route_add.route} опередлён поезду с номером '#{@number}'."
      puts "--------------------------------------------------------- \n"
      puts "Поезд с номером '#{@number}' помещен на первую станцию маршрута: '#{@current_station}'."
    else
      puts "Ошибка. Введенные данные не являются маршрутом."
    end
  end

  def move_forward
    if @next_station != nil
      @previous_station = @current_station
      @current_station = @route_add.route[@current_station_index + 1]
      @next_station = @route_add.route[@current_station_index + 2]
      puts "Поезд с номером '#{@number}' прибыл на станцию '#{@current_station}'."
      @current_station_index += 1
    else
      puts "Поезд с номером '#{@number}' находится на конечной станции '#{@current_station}'."
    end
  end

  def move_back
    if @previous_station != nil && @current_station_index > 0
      @next_station = @current_station
      @current_station =  @route_add.route[@current_station_index - 1]
      @previous_station = @route_add.route[@current_station_index - 2]
      puts "Поезд с номером '#{@number}' прибыл на станцию '#{@current_station}'"
      @current_station_index -= 1
    else
      puts "Поезд с номером '#{@number}' находится на конечной станции '#{@current_station}'."
    end
  end
end
