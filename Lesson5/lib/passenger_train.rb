class PassengerTrain < Train
  def initialize(name)
    super(name, :passenger)
  end

  #исправление замечания: проверка в наследнике возможности прицепить вагон
  def attachable_wagon?(wagon)
    wagon.is_a?(PassengerWagon)
  end
end
