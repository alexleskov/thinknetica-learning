class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @train_list = {}
    @trains_count = 0
    puts "Добавлена новая станция: '#{@name}'."
  end

  def train_get(train_number, vagon_type, vagon_count)
    if @train_list.include?(train_number)
      puts "Этот поезд уже находится на станции '#{@name}'."
    else
      @train_list[train_number] = { type: vagon_type, count: vagon_count }
      @trains_count += 1
      puts "Поезд с номером '#{train_number}', тип '#{vagon_type}', количество вагонов #{vagon_count} - принят на станцию '#{@name}'."
    end
  end

  def trains_show
    puts "Список всех поездов на станции #{@name}:" if @trains_count != 0
    @train_list.each do |train_number, info|
      puts " * Номер поезда: #{train_number}, тип: #{info[:type]}, количество вагонов: #{info[:count]}."
      puts "--------------------------------------------------------"
    end
    puts "Поездов на станции сейчас: #{@trains_count}."
  end

  def let_train_go(train_number)
    if @train_list.include?(train_number)
      @train_list.delete(train_number)
      @trains_count -= 1
      puts "Поезд с номером '#{train_number}' только что был отправлен со станции '#{@name}'."
    else
      puts "Поезда с таким номером нет на станции '#{@name}'."
    end
  end
end
