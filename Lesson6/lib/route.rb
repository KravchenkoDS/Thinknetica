require_relative '../lib/instance_counter'

class Route
  include InstanceCounter

  attr_reader :stations

  NO_EXIST_STATION_ERROR = 'Одна или более станций не существует'
  EQUALS_STATION_ERROR = 'Начальная и конечная станции совпадают'

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    register_instance
  end

  def first_station
    stations.first
  end

  def last_station
    stations.last
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    return if [first_station, last_station].include?(station)
    stations.delete(station)
  end

  def show_stations
    stations.each { |station| puts station.name }
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def validate!
    raise NO_EXIST_STATION_ERROR unless @stations.first.is_a?(Station) && @stations.last.is_a?(Station)
    raise EQUALS_STATION_ERROR if @stations.first.is_a?(Station) == @stations.last.is_a?(Station)
  end
end
