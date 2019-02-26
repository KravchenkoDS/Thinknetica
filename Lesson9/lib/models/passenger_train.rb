require_relative '../common/common'
class PassengerTrain < Train
  include Common
  attr_reader :type
  attr_accessor_with_history :route

  validate :number, :presence
  validate :number, :format, FORMAT_NUMBER
  validate :number, :type, String
  def initialize(number)
    super(number)
    @type = :passenger
  end

  # исправление замечания: проверка в наследнике возможности прицепить вагон
  def attachable_wagon?(wagon)
    wagon.is_a?(PassengerWagon)
  end
end
