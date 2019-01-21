class CargoTrain < Train
  def initialize(name)
    super(name, :cargo)
  end

  #исправление замечания: проверка в наследнике возможности прицепить вагон
  def attachable_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end
end
