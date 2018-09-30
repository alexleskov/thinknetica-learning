class PassengerWagon < Wagon
  attr_reader :seats, :occupied_seats 

  def initialize(number, seats, occupied_seats = 0)
    @seats = seats
    @occupied_seats = occupied_seats
    super(number, :passenger)
  end

  def take_a_seat
    raise "Все места в вагоне уже заняты" if seats == 0
    if seats > 0
      @seats -= 1
      @occupied_seats +=1
    end
  end

  def validate!
    raise "Необходимо указать корректное количество мест в вагоне" if seats.nil? || seats <= 0
    super
  end

end
