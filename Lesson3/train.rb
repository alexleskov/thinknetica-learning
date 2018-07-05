class Train
	attr_accessor(:number, :speed)
	attr_reader (:type)
	attr_reader (:vagon_count)

	def initialize(number, type, vagon_count, speed = 0)
		@number = number
		@type = type
		@vagon_count = vagon_count
		@speed = speed
	end

	def speed_break
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
		if @vagon_count <= 0 || @speed > 0
			puts "Вагон отцепить нельзя."
		else
			@vagon_count -= 1
			puts "У поезда с номером '#{@number}' отцеплён вагон. Всего вагонов прицеплено: #{@vagon_count}."
		end
	end

	def route_show
		if @add_route != nil
			puts "Маршрут поезда с номером '#{@number}': #{@add_route.route}."
			puts "Текущая станция: '#{@current_station}'. Следующая станция: '#{@next_station}'"
		end
	end

	def add_route=(add_route)
		if add_route.class == Route
			@add_route = add_route
			puts "Маршрут #{@add_route.route} опередлён поезду с номером '#{@number}'."
			puts "---------------------------------------------------------"
			@current_station = @add_route.route[0]
			@next_station = @add_route.route[1]
			puts "Поезд с номером '#{@number}' помещен на первую станцию маршрута: '#{@current_station}'"
		else
			puts "Ошибка. Введенные данные не являются маршрутом."
		end
	end

	def move_forward
		current_index = @add_route.route.index(@current_station)
		next_index = current_index + 1
		@current_station =  @add_route.route[next_index]
		@next_station = @add_route.route[next_index + 1]
	end

#	def move_back

#	end

#	def road_map

#	end
end
