class CargoWagon < Wagon
  def initialize(number, volume)
    super(number, :cargo, volume)
  end

  def reserve_space(amount)
    raise "Недостаточно места." if available_space - amount < 0
    super(amount)
  end
end
