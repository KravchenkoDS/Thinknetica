class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
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
end
