require_relative '../common/instance_counter'
require_relative '../common/validation'
require_relative '../common/accessors'
require_relative '../common/common'

class Station
  include InstanceCounter
  include Validation
  extend Accessors
  include Common
  attr_reader :trains, :name

  validate :name, :presence
  validate :name, :format, FORMAT_NUMBER

  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def self.all
    @@stations
  end

  def each_train
    @trains.each { |train| yield(train) }
  end

  def accept_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train)
  end

  def select_trains(type)
    trains.select { |train| train.type == type }
  end
end
