class Wagon
	attr_reader :number, :type, :current_train

	def initialize(number)
		@number = number
	end

	def connect_to(train)
    return unless current_train.nil? && train.is_a?(Train)
    if train.speed == 0 && self.type == train.type
			set_current_train(train)
      train.wagon_add(self)
    end
	end

	def unconnect_from(train)
		return if current_train.nil?
    if train.speed == 0
      set_current_train(nil)
      train.wagon_remove(self)
    end
	end

  protected

  # Метод, необходимый для работы других методов connect_to и unconnect_from.
  # Вызов этого метода напрямую приведёт к серьезным проблемам и нарушает принцип
  # инкапсуляции.
  # protected - потому что должен быть доступен и в подклассах.

  def set_current_train(train)
    @current_train = train
  end

end