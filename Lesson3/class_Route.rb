class Route
	attr_accessor :station_begin
	attr_accessor :station_end
	attr_accessor :transit_station
	attr_accessor :remove_station

	def initialize(station_begin, station_end)
		@route = [station_begin, station_end]
		puts "Маршрут со станции '#{station_begin}', до станции '#{station_end}' создан."
	end

	def route_add(transit_station)
		if @route.include?(transit_station)
			print "Такая станция уже есть в маршруте."
		else
			@route.insert(-2,transit_station)
			puts "Промежуточная станция '#{transit_station}' добавлена в маршут."
		end
	end

	def route_remove(remove_station)
		if @route.include?(remove_station)
			@route.delete(remove_station)
			puts "Станция '#{remove_station}' удалена из маршрута."
		else
			puts "Такой станции нет в машруте."
		end
	end

	def route_show
		puts "Маршрут:"
		@route.each { |station_name| print "[#{station_name}]-" }
	end
end
