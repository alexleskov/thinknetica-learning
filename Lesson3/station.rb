class Station
  attr_reader(:TrainS, :name, :trains_count)

  def initialize(name)
    @name = name
    @TrainS = []
  end

  def train_get(train)
    if train.class == Train && !@TrainS.include?(train)
      @TrainS << train
    end
  end

  def train_send(train)
    if train.class == Train && @TrainS.include?(train)
      @TrainS.delete(train)
    end
  end

	def trains_count
		@TrainS.size
	end

  def trains_list
		@TrainS.each do |train|
			puts " * Номер поезда: #{train.number}, тип: #{train.type}, количество вагонов: #{train.vagon_count}."
			puts "--------------------------------------------------------"
		end
  end

  def trains_list_by_type
		passenger_trains = @TrainS.select { |train| train.type == "passenger" }
		passenger_count = passenger_trains.size
		cargo_trains = @TrainS.select { |train| train.type == "cargo" }
		cargo_count = cargo_trains.size
	end
end
