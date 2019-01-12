require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'wagon.rb'
require_relative 'passenger_train.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_wagon.rb'
require_relative 'cargo_wagon.rb'
require_relative 'menu_items.rb'

class MainMenu
  def initialize
    @stations = []
    @trains = []
    @wagons = []
    @routes = []
  end

  def show_menu
    choices_list(SHOW_MENU_LIST, true)
    input = gets.chomp
    loop do
      case input.to_i
      when 1
        stations_menu
      when 2
        trains_menu
      when 3
        wagons_menu
      when 4
        create_route_menu
      when EXIT
        exit
      else
        enter_another_value
        input = gets.chomp
      end
    end
  end

  private

  def stations_menu
    stations_menu_intro
    choices_list(STATIONS_MENU_LIST, true)
    input = gets.chomp
    loop do
      case input.to_i
      when 1
        create_station
      when 2
        stations_list
        # stations_menu #рекурсивный вызов
        show_menu
      when 3
        trains_menu
      when 4
        show_menu
      when EXIT
        exit
      else
        enter_another_value
        input = gets.chomp
      end
    end
  end

  def trains_menu
    trains_menu_intro
    choices_list(TRAINS_MENU_LIST, true)
    input = gets.chomp
    loop do
      case input.to_i
      when 1
        create_train
      when 2
        stations_menu
      when 3
        routes_menu
      when 4
        wagons_menu_for_train
      when 5
        move_train_menu
      when 6
        stations_and_trains
      when EXIT
        exit
      else
        enter_another_value
        input = gets.chomp
      end
    end
  end

  # Для вызова из меню поездов
  def routes_menu
    if @trains.empty?
      puts CREATE_STATIONS_MESSAGE # 'Сначало создайте поезд.'
      create_train
    end
    if @stations.length < 2
      puts CREATE_STATIONS_MESSAGE # 'Сначало создайте как минимум две станции.'
      create_station
    end
    select_train_from_list_message
    number = gets.chomp
    train = select_train(number)
    create_route_intro
    input = gets.chomp
    loop do
      case input.to_i
      when 1
        stations_menu
      when 2
        create_route(train, true)
      when EXIT
        exit
      else
        enter_another_value
        input = gets.chomp
      end
    end
  end

  # Для вызова из корневого меню
  def create_route_menu
    create_route_intro
    input = gets.chomp
    loop do
      case input.to_i
      when 1
        stations_menu
      when 2
        create_route(false)
      when EXIT
        exit
      else
        enter_another_value
        input = gets.chomp
      end
    end
  end

  # Для вызова из корневого меню
  def wagons_menu
    choices_list(WAGON_MENU_LIST, true)
    input = gets.chomp
    loop do
      case input.to_i
      when 1
        create_wagon
      when 2
        manufacturers_list
        break
      when EXIT
        exit
      else
        enter_another_value
        input = gets.chomp
      end
    end
  end

  # Для вызова из меню поездов
  def wagons_menu_for_train
    select_train_from_list_message
    number = gets.chomp
    train = select_train(number)
    choices_list(WAGON_ADD_UNHOOK_MENU_LIST, BACK_TO_TRAIN_MANAGEMENT_MESSAGE)
    input = gets.chomp
    loop do
      case input.to_i
      when 1
        enter_manufacturer_name_message
        manufacturer = gets.chomp
        wagon = create_wagon_for_train(train, manufacturer)
        train.add_wagon(wagon)
        add_wagon(wagon)
        trains_menu
      when 2
        enter_number_wagon_message
        wagon = gets.chomp
        train.remove_wagon(wagon)
        trains_menu
      when 3
        trains_menu
      else
        enter_another_value
        input = gets.chomp
      end
    end
  end

  def move_train_menu
    select_train_from_list_message
    number = gets.chomp
    train = select_train(number)
    routes_menu if train.route.nil?
    choices_list(MOVE_TRAIN_MENU_LIST, true)
    input = gets.chomp
    loop do
      case input.to_i
      when 1
        train.move_to_next_station
        move_train_menu
      when 2
        train.move_to_previous_station
        move_train_menu
      when 3
        trains_menu
      when EXIT
        exit
      else
        enter_another_value
        input = gets.chomp
      end
    end
  end

  # Вспомогательные методы для станций:
  def create_station
    print INPUT_NAME_STATION_MESSAGE # 'Введите название новой станции: '
    loop do
      name = gets.chomp
      if station_exist?(name)
        print STATION_EXISTS_MESSAGE # 'Такая станция существует, введите другое значение: '
      else
        @stations << Station.new(name)
        station_created_message(name)
        break
      end
    end
    stations_menu
  end

  def station_exist?(name)
    !!@stations.detect { |station| station.name == name }
  end

  def stations_list
    names = []
    @stations.each do |station|
      names << station.name
    end
    blank_line
    puts names.join(', ')
  end

  def select_station(name)
    selected_stations = @stations.select { |station| station.name == name }
    if selected_stations.empty?
      puts ENTER_CORRECTION_NAME_STATION_MESSAGE # 'Введите правильное имя станции и повторите попытку.'
      routes_menu
    else
      selected_stations.first
    end
  end

  def stations_and_trains
    create_station if @stations.empty?
    create_train if @trains.empty?
    puts STATIONS_LIST_MESSAGE # 'Список станций: '
    @stations.each do |station|
      if !station.trains.empty?
        trains = []
        station.trains.each do |train|
          trains << train.number
        end
        puts "Станция #{station.name}, поезда: #{trains.join(', ')}"
      else
        puts "Станция #{station.name}"
      end
    end
    puts LIST_OF_TRAINS_MESSAGE # 'Общий список поездов:'
    trains_list
    trains_menu
  end

  # Вспомогательные методы для поездов:
  def create_train
    print ENTER_NAME_NEW_TRAIN_MESSAGE # 'Введите номер нового поезда: '
    loop do
      number = gets.chomp
      if train_exist?(number)
        print ENTER_ANOTHER_NUMBER_MESSAGE # Такой номер существует, введите другое значение: '
      else
        create_train_by_type(number)
        train_created_message(number)
        break
      end
    end
    trains_menu
  end

  def create_train_by_type(number)
    choices_list(CREATE_TRAIN_BY_TYPE_MENU_LIST, false)
    input = gets.chomp
    loop do
      case input.to_i
      when 1
        @trains << PassengerTrain.new(number)
        break
      when 2
        @trains << CargoTrain.new(number)
        break
      else
        enter_another_value
        input = gets.chomp
      end
    end
  end

  def train_exist?(number)
    !!@trains.detect { |train| train.number == number }
  end

  def trains_list
    numbers = []
    @trains.each do |train|
      numbers << train.number
    end
    puts numbers.join(', ')
  end

  def select_train(number)
    selected_trains = @trains.select { |train| train.number == number }
    if selected_trains.empty?
      puts ENTER_CORRECTION_NUMBER_TRAIN_MESSAGE # 'Введите правильный номер поезда и повторите попытку.'
      routes_menu
    else
      selected_trains.first
    end
  end

  def create_route(*args)
    # Количество входящих данных будет различаться в зависимости от места видимости метода.
    # При вызова из корня меню объект train не передаётся.
    route_for_train = args.last
    first_station, second_station = name_first_and_second_stations()
    route = Route.new(first_station, second_station)
    loop do
      puts ADD_ROUTE_STATION # 'Добавить станцию маршрута?'
      choices_list(YES_NO, false)
      input = gets.chomp
      case input.to_i
      when 1
        puts ENTER_NAME_STATION # 'Введите название станции: '
        input = gets.chomp
        station = select_station(input)
        route.add_station(station)
      when 2
        if route_for_train
          train = args.first
          train.set_route(route)
          add_route(route)
          trains_menu
        else
          add_route(route)
          create_route_menu
        end
      else
        enter_another_value
        input = gets.chomp
      end
    end
  end

  # Вспомогательные методы для вагонов
  def create_wagon_for_train(train, manufacturer)
    train.type == :cargo ? CargoWagon.new(manufacturer) : PassengerWagon.new(manufacturer)
  end

  def create_wagon
    enter_manufacturer_name_message
    manufacturer = gets.chomp
    choices_list(CREATE_WAGON_MENU_LIST, false)
    input = gets.chomp
    loop do
      case input.to_i
      when 1
        @wagons << PassengerWagon.new(manufacturer)
        wagons_menu
      when 2
        @wagons << CargoWagon.new(manufacturer)
        wagons_menu
      else
        enter_another_value
        input = gets.chomp
      end
    end
  end

  def manufacturers_list
    manufacturers = []
    @wagons.each do |wagon|
      manufacturers << wagon.manufacturer
    end
    blank_line
    puts manufacturers.join(', ')
  end

  def add_wagon(wagon)
    @wagons << wagon
  end

  def add_route(route)
    @routes << route
  end

  def name_first_and_second_stations
    print ENTER_NAME_FIRST_STATION # 'Введите имя первой станции: '
    input = gets.chomp
    first_station = select_station(input)
    print ENTER_NAME_SECOND_STATION # 'Введите имя второй станции: '
    input = gets.chomp
    second_station = select_station(input)
    [first_station, second_station]
  end
end
