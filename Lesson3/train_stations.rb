class Station
	@@station = {}
	@@trains_count = 0
	def initialize(name_station)
		@@name_station = name_station
		puts "Добавлена новая станция: '#{@@name_station}'."
	end
	def self.get_train(train_number, vagon_type, vagon_count)
		@train_number = train_number
		@vagon_type = vagon_type
		@vagon_count = vagon_count
		if @@station.include?(train_number)
			puts "Этот поезд уже находится на станции '#{@@name_station}'."
		else
			@@station[train_number] = { type: vagon_type, count: vagon_count }
			@@trains_count += 1
			puts "Поезд с номером '#{train_number}', тип '#{vagon_type}', количество вагонов #{vagon_count} - принят на станцию '#{@@name_station}'."
		end
	end
	def self.list_all
		puts "Список всех поездов на станции '#{@@name_station}':" if @@trains_count != 0
		@@station.each do |train_number, info|
			puts " * Номер поезда: #{train_number}, тип: #{info[:type]}, количество вагонов: #{info[:count]}."
			puts "--------------------------------------------------------"
		end
		puts "Поездов на станции сейчас: #{@@trains_count}."
	end
	def self.let_train_go(train_number)
		if @@station.include?(train_number)
			@@station.delete(train_number)
			@@trains_count -= 1
			puts "Поезд с номером '#{train_number}' только что был отправлен со станции '#{@@name_station}'."
		else
			puts "Поезда с таким номером нет на станции '#{@@name_station}'."
		end
	end
end

first_station = Station.new("TheFirst")
train1 = Station.get_train(1, "Пассажирский", 20)
train2 = Station.get_train(2, "Грузовой", 10)
