class PassengerWagon < Wagon
  DEFAULT_VOLUME = 1
  def initialize(number, volume = DEFAULT_VOLUME)
    super(number, :passenger, volume)
  end

  def reserve_space
    raise 'Бронь недоступна.' if available_space <= 0

    super(1)
  end
end
