require_relative '../common/common'
require_relative '../description_objects/route.rb'

module RouteMenu
  include Common

  def route_menu
    loop do
      create_route_intro
      case gets.to_i
      when 1 then create_route
      when 2 then add_route_station
      when 3 then delete_route_station
      when 4 then routes_list
      else break
      end
    end
  end

  def create_route
    print CREATE_STATIONS_MESSAGE if @stations.empty?
    puts STATIONS_LIST_MESSAGE # 'Список станций: '
    stations_list
    first_station, last_station = select_stations
    @routes << Route.new(first_station, last_station)
    route_created_message
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def delete_route_station
    puts ROUTE_LIST_MESSAGE
    routes_list
    route = select_from_list(@routes)
    puts STATIONS_LIST_MESSAGE
    print_stations_in_route(route)
    station = select_from_list(@stations)
    route.delete_station(station)
  end

  def add_route_station
    puts ROUTE_LIST_MESSAGE
    routes_list
    route = select_from_list(@routes)
    puts STATIONS_LIST_MESSAGE
    stations_list
    station = select_from_list(@stations)
    return show_error if route.nil? || station.nil?

    route.add_station(station) # добавляем
  end
end
