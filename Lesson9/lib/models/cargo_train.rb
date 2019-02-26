require_relative '../common/common'
class CargoTrain < Train
  include Common
  attr_reader :type

  validate :number, :presence
  validate :number, :format, FORMAT_NUMBER
  validate :number, :type, String
  def initialize(number)
    super(number)
    @type = :cargo
  end

  def attachable_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end
end
