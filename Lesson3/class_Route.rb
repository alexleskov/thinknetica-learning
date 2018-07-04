class Route
	attr_accessor :station_begin
	attr_accessor :station_end

	def initialize(station_begin, station_end)
		@route = [  ]
	end
end
