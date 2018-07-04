class Station
  attr_accessor :station_name
  attr_accessor :train_number
  attr_accessor :vagon_type
  attr_accessor :vagon_count

  def initialize(station_name)
    @station = {}
    @trains_count = 0
    puts "Добавлена новая станция: '#{station_name}'."
  end

  def get_train(train_number, vagon_type, vagon_count)
    if @station.include?(train_number)
      puts "Этот поезд уже находится на станции '#{@@station_name}'."
    else
      @station[train_number] = { type: vagon_type, count: vagon_count }
      @trains_count += 1
      puts "Поезд с номером '#{train_number}', тип '#{vagon_type}', количество вагонов #{vagon_count} - принят на станцию '#{@@station_name}'."
    end
  end

  def list_all_trains
    puts "Список всех поездов на станции #{@@station_name}:" if @trains_count != 0
    @station.each do |train_number, info|
      puts " * Номер поезда: #{train_number}, тип: #{info[:type]}, количество вагонов: #{info[:count]}."
      puts "--------------------------------------------------------"
    end
    puts "Поездов на станции сейчас: #{@trains_count}."
  end

  def let_train_go(train_number)
    if @station.include?(train_number)
      @station.delete(train_number)
      @trains_count -= 1
      puts "Поезд с номером '#{train_number}' только что был отправлен со станции '#{@@station_name}'."
    else
      puts "Поезда с таким номером нет на станции '#{@@station_name}'."
    end
  end
end