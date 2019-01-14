module MenuItems
  SHOW_MENU_LIST = [
      'управление станциями',
      'управление поездами',
      'управление вагонами',
      'управление маршрутами'
  ].freeze

  STATIONS_MENU_LIST = [
      'создание станции',
      'список станций',
      'перейти к управлению поездами',
      'вернуться в корневое меню'
  ].freeze

  TRAINS_MENU_LIST = [
      'создать новый поезд',
      'перейти к управлению станциями',
      'назначить маршрут поезду',
      'управление вагонами',
      'переместить поезд по маршруту',
      'открыть список станций и поездов'
  ].freeze

  WAGON_MENU_LIST = [
      'создать новый вагон',
      'посмотреть производителей вагонов'
  ].freeze

  WAGON_ADD_UNHOOK_MENU_LIST = [
      'добавить вагон',
      'отцепить вагон'
  ].freeze

  MOVE_TRAIN_MENU_LIST = [
      'отправить на следующую станцию',
      'отправить на предыдущую станцию',
      'вернуться к управлению поездами'
  ].freeze

  CREATE_WAGON_MENU_LIST = [
      'создать пассажирский вагон',
      'создать грузовой вагон'
  ].freeze

  CREATE_TRAIN_BY_TYPE_MENU_LIST = [
      'пассажирский поезд', 'грузовой поезд'
  ].freeze

  CREATE_NEW_STATION_OR_CURRENT = [
      'создать новую станцию',
      'продолжить с текущими'
  ].freeze

  YES_NO = %w[да нет].freeze

  CREATE_TRAIN_MESSAGE = 'Сначало создайте поезд.'.freeze
  CREATE_STATIONS_MESSAGE = 'Сначало создайте как минимум две станции.'.freeze
  INPUT_NAME_STATION_MESSAGE = 'Введите название новой станции: '.freeze
  STATION_EXISTS_MESSAGE = 'Такая станция существует, введите другое значение: '.freeze
  STATIONS_LIST_MESSAGE = 'Список станций: '.freeze
  ENTER_CORRECTION_NAME_STATION_MESSAGE = 'Введите правильное имя станции и повторите попытку.'.freeze
  ENTER_CORRECTION_NUMBER_TRAIN_MESSAGE = 'Введите правильный номер поезда и повторите попытку.'.freeze
  ENTER_NAME_NEW_TRAIN_MESSAGE = 'Введите номер нового поезда: '.freeze
  ENTER_ANOTHER_NUMBER_MESSAGE = 'Такой номер существует, введите другое значение: '.freeze
  ENTER_ANOTHER_VALUE = 'Введите другое значение: '.freeze
  ENTER_NAME_STATION = 'Введите название станции: '.freeze
  ENTER_NAME_FIRST_STATION = 'Введите имя первой станции: '.freeze
  ENTER_NAME_SECOND_STATION = 'Введите имя второй станции: '.freeze
  BACK_TO_TRAIN_MANAGEMENT_MESSAGE = 'вернуться к управлению поездами'.freeze
  LIST_OF_TRAINS_MESSAGE = 'Общий список поездов:'.freeze
  FOLLOWING_STATIONS_ROUTE_MESSAGE = 'Для составления маршрута доступны следующие станции:'.freeze
  CREATE_STATIONS_OR_CURRENT_MESSAGE = 'Вы хотите создать новую cтанцию или продолжить с текущими?'.freeze

  SEPARATOR_STRING = '==='.freeze
  ADD_ROUTE_STATION = 'Добавить станцию маршрута?'.freeze
  STATION_STRING = 'Станция '.freeze
  STATION_MANAGEMENT = 'Управление станциями:'.freeze
  TRAIN_MANAGEMENT = 'Управление станциями:'.freeze

  ENTER_NAME_MANUFACTURER = 'Введите название производителя: '.freeze
  ENTER_NUMBER_WAGON_TRAIN = 'Введите номер вагона поезда: '.freeze
  ENTER_NUMBER_WAGON_FROM_LIST = 'Введите номер поезда из списка:'.freeze

  TO_EXIT_APPLICATION_0 = '0 - для выхода из приложения'.freeze

  EXIT = 0
  EXIT.freeze

# Прочие вспомогательные методы:
  def choices_list(*options, extra_lines)
    puts 'Введите:'
    number = 1
    options[0].each do |option|
      puts "#{number} - #{option}"
      number += 1
    end
    if extra_lines
      puts TO_EXIT_APPLICATION_0 # '0 - для выхода из приложения'
      print '> '
    end
  end

  def blank_line
    # Отступ для читаемости вывода данных
    puts ''
  end

# Вспомогательные методы инпута и аутпута
  def enter_another_value
    print ENTER_ANOTHER_VALUE # 'Введите другое значение: '
  end

  def create_route_intro
    puts FOLLOWING_STATIONS_ROUTE_MESSAGE # 'Для составления маршрута доступны следующие станции:'
    stations_list
    puts CREATE_STATIONS_OR_CURRENT_MESSAGE # 'Вы хотите создать новую cтанцию или продолжить с текущими?'
    #choices_list('создать новую станцию', 'продолжить с текущими', false)
    choices_list(CREATE_NEW_STATION_OR_CURRENT, false)
  end

  def stations_menu_intro
    puts SEPARATOR_STRING
    puts STATION_MANAGEMENT # 'Управление станциями:'
  end

  def trains_menu_intro
    puts SEPARATOR_STRING
    puts TRAIN_MANAGEMENT # 'Управление поездами:'
  end

  def enter_manufacturer_name_message
    puts ENTER_NAME_MANUFACTURER # 'Введите название производителя: '
  end

  def enter_number_wagon_message
    puts ENTER_NUMBER_WAGON_TRAIN # 'Введите номер вагона поезда: '
  end

  def select_train_from_list_message
    puts ENTER_NUMBER_WAGON_FROM_LIST # 'Введите номер поезда из списка:'
    trains_list
  end

  def train_created_message(number)
    blank_line
    puts "Поезд #{number} успешно создан."
  end

  def station_created_message(name)
    blank_line
    puts "Станция #{name} успешно создана."
  end

  def get_input_from_user()
    input = 0 # обнулим предидущее знаечние ввода
    input = gets.chomp
    return input
  end
end