class Vagon
	attr_reader :current_train, :number, :type

	def initialize(number,type)
		@number = number
		@type = type
		@current_train = nil
	end

	def connect_to_train(train)
    return if train == @current_train
    if train.is_a?(Train) && train.speed == 0
			@current_train = train
			@current_train.vagon_add(self)
    end
	end

	def unconnect_from_train(train)
		return if @current_train == nil
    if train.speed == 0
      @current_train = nil
			@current_train.vagon_remove(self)			
    end
	end

end