class Vagon
	attr_reader :current_train

	def initialize(number,type)
		@number = number
		@type = type
		@current_train = nil
	end

	def connect_to_train(train)
    return if train.vagons.include?(self)
    if train.speed == 0 && @current_train == nil
			@current_train = train
			@current_train.vagon_add(self)
    end
	end

	def unconnect_from_train(train)
		return unless train.vagons.include?(self)
    if train.speed == 0 && @current_train == train
			@current_train.vagon_remove(self)
			@current_train = nil
    end
	end

end