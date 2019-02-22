require_relative '../common/common'
require_relative '../description_objects/station.rb'

module StationsMenu
  include Common

  def stations_menu
    loop do
      stations_menu_intro
      choices_list(STATIONS_MENU_LIST, false)
      case gets.to_i
      when 1 then create_station
      when 2 then stations_list
      else break
      end
    end
  end

  def create_station
    print INPUT_NAME_STATION_MESSAGE # 'Введите название новой станции: '
    name = gets.chomp
    return print STATION_EXISTS_MESSAGE if station_exist?(name)

    @stations << Station.new(name)
    station_created_message(name)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def select_stations
    print ENTER_ID_FIRST_STATION # 'Введите номер первой станции: '
    first_station = select_from_list(@stations)
    print ENTER_ID_SECOND_STATION # 'Введите номер второй станции: '
    last_station = select_from_list(@stations)
    [first_station, last_station]
  end
end
