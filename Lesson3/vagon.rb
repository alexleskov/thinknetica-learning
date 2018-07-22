class Vagon
	attr_reader :current_train

	def initialize(number,type)
		@number = number
		@type = type
		@current_train = nil
	end

	def connect_to_train(train)
		if train.is_a?(Train) && @current_train == nil && train.speed == 0
			@current_train = train
		end 
	end

	def unconnect_from_train(train)
		if @current_train == train && train.speed == 0
			@current_train = nil
		end
	end

end