class Station
  attr_reader :name

  @@stations_list = []

  def initialize(name, trains_count = 0)
    @name = name
    @@stations_list << @name
    @train_list = {}
    @trains_count = trains_count
    puts "Добавлена новая станция: '#{@name}'."
  end

  def receive_on(train)
    if train.class == Train && !@train_list.include?(train.number)
      @train_number = train.number
      @train_list[@train_number] = { type: train.type, vagon_count: train.vagon_count }
      @trains_count += 1
      puts "Поезд с номером '#{@train_number}', тип '#{@train_list[@train_number][:type]}', количество вагонов #{@train_list[@train_number][:vagon_count]} - принят на станцию '#{@name}'."
    else
      puts "Ошибка. Введенные данные не являются поездом, либо этот поезд уже есть на станции."
    end
  end

  def forward_to(train)
    if train.class == Train && @train_list.include?(train.number)
      @train_number = train.number
      @train_list.delete(@train_number)
      @trains_count -= 1
      puts "Поезд с номером '#{@train_number}' только что был отправлен со станции '#{@name}'."
    else
      puts "Ошибка. Введенные данные не являются поездом, либо этот поезд уже отсутствует на станции."
    end
  end

  def list
    if @trains_count != 0
      puts "Список всех поездов на станции '#{@name}':"
      @train_list.each do |number, info|
        puts " * Номер поезда: #{number}, тип: #{info[:type]}, количество вагонов: #{info[:vagon_count]}."
        puts "--------------------------------------------------------"
      end
    end
    puts "Поездов на станции сейчас: #{@trains_count}."
  end

  def list_by_type
    if @trains_count != 0
      @passenger_count = 0
      @cargo_count = 0
      @train_list.each_value do |info|
        if info[:type] == "passenger"
          @passenger_count += 1
        elsif info[:type] == "cargo"
          @cargo_count += 1
        end
      end
        puts "Количество пассажирских поездов: #{@passenger_count}.\nКоличество грузовых поездов: #{@cargo_count}."
        puts "-----------------------------------"
    end
        puts "Поездов на станции сейчас: #{@trains_count}."
  end

  def self.list
    puts "Список всех станций: #{@@stations_list}"
  end
end
