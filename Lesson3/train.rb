class Train
  attr_reader(:type, :vagon_count, :speed, :number)

  def initialize(number, type, vagon_count)
    @number = number
    @type = type
    @vagon_count = vagon_count
    @speed = 0
  end

	def speed_up(value)
		@speed += value
	end

  def speed_down(value)
		@speed -= value if speed - value >= 0
  end

  def vagon_add
    @vagon_count += 1 if speed == 0
  end

  def vagon_remove
    @vagon_count -= 1 if vagon_count != 0 && speed == 0
  end

	def route_add(route)
		if route.class == Route
			@route = route
			@route_stations = @route.StationS
			@first_station = @route_stations.first
			@last_station = @route_stations.last
			@previous_station = @route_stations.rotate(-1).first
			@next_station = @route_stations.rotate.first
			self.initialize_route_list
		end
	end

	def initialize_route_list
		self.current_station
		self.next_station
		self.previous_station
	end

	def current_station
		@current_station = @route_stations.first
	end

	def next_station
		if @next_station == @first_station
			@next_station = nil
		else
			@next_station = @route_stations.rotate.first
		end
	end

	def previous_station
		if @previous_station == @last_station
			@previous_station = nil
		else
			@previous_station = @route_stations.rotate(-1).first
		end
	end

  def route_list
		@route_list = [@previous_station, @current_station, @next_station]
  end

  def move_forward
		self.current_station
		if @current_station == @last_station
			abort
		else
			@route_stations = @route_stations.rotate
			self.initialize_route_list
		end
  end

  def move_back
		self.current_station
		if @current_station == @first_station
			abort
		else
			@route_stations = @route_stations.rotate(-1)
			self.initialize_route_list
		end
	end
end
