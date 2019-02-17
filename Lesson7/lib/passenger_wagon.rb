class PassengerWagon < Wagon
  def initialize(number, volume)
    super(number, :passenger, volume)
  end

  def reserve_space
    raise "Бронь недоступна." if available_space <= 0
    super(1)
  end
end
