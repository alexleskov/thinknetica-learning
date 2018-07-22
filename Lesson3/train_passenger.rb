class PassengerTrain < Train

	def initialize(number, type, vagon_count)
		return if type != :passenger
		super
	end
	
end