require_relative '../common/common'
require_relative '../description_objects/train.rb'
require_relative '../description_objects/passenger_train.rb'
require_relative '../description_objects/cargo_train.rb'

module TrainsMenu
  include Common

  def trains_menu
    loop do
      choices_list(TRAINS_MENU_LIST, false)
      case gets.to_i
      when 1 then create_train
      when 2 then set_train_route
      when 3 then wagons_menu_train
      when 4 then move_train_menu
      else break
      end
    end
  end

  def move_train_menu
    loop do
      train = select_train
      choices_list(MOVE_TRAIN_MENU_LIST, true)
      case gets.to_i
      when 1 then train.move_to_next_station
      when 2 then train.move_to_previous_station
      else break
      end
    end
  end

  def create_train
    print ENTER_NAME_NEW_TRAIN_MESSAGE # 'Введите наименование нового поезда: '
    number = gets.chomp
    return print ENTER_ANOTHER_NUMBER_MESSAGE if train_exist?(number)

    create_train_by_type(number)
    train_created_message(number)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def create_train_by_type(number)
    choices_list(CREATE_TRAIN_BY_TYPE_MENU_LIST, false)
    case gets.to_i
    when 1 then @trains << PassengerTrain.new(number)
    when 2 then @trains << CargoTrain.new(number)
    else enter_another_value
    end
  end

  def set_train_route
    puts TRAIN_LIST_MESSAGE
    trains_list
    train = select_from_list(@trains)
    puts ROUTE_LIST_MESSAGE
    routes_list
    route = select_from_list(@routes)
    return if train.nil? || route.nil?

    train.add_route(route)
  end

  def select_train
    puts TRAIN_LIST_MESSAGE
    trains_list
    selected_train = select_from_list(@trains)
    raise ENTER_CORRECTION_NUMBER_TRAIN if selected_train.nil?

    selected_train
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def stations_and_trains
    puts STATIONS_LIST_MESSAGE # 'Список станций: '
    print_stations_and_trains
    puts LIST_OF_TRAINS_MESSAGE # 'Общий список поездов:'
    trains_list
  end

  def check_train
    puts CREATE_TRAIN_MESSAGE if @trains.empty?
  end
end
