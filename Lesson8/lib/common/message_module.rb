module MessageModule
  CREATE_TRAIN_MESSAGE = 'Сначало создайте поезд.'.freeze
  CREATE_STATIONS_MESSAGE = 'Сначало создайте как минимум две станции.'.freeze
  INPUT_NAME_STATION_MESSAGE = 'Введите название новой станции: '.freeze
  STATION_EXISTS_MESSAGE = 'Такая станция существует, введите другое значение: '.freeze
  STATIONS_LIST_MESSAGE = 'Список станций: '.freeze
  ROUTE_LIST_MESSAGE = 'Список маршрутов: '.freeze
  TRAIN_LIST_MESSAGE = 'Список поездов: '.freeze
  ENTER_CORRECTION_NAME_STATION = 'Введите правильное имя станции и повторите попытку.'.freeze
  ENTER_CORRECTION_NUMBER_TRAIN = 'Введите правильный номер поезда и повторите попытку.'.freeze
  ENTER_NAME_NEW_TRAIN_MESSAGE = 'Введите наименование нового поезда: '.freeze
  ENTER_ANOTHER_NUMBER_MESSAGE = 'Такое наименование существует, введите другое значение: '.freeze
  ENTER_ANOTHER_VALUE = 'Введите другое значение: '.freeze
  ENTER_NAME_STATION = 'Введите название станции: '.freeze
  ENTER_ID_FIRST_STATION = 'Введите номер первой станции: '.freeze
  ENTER_ID_SECOND_STATION = 'Введите номер второй станции: '.freeze
  BACK_TO_TRAIN_MANAGEMENT = 'вернуться к управлению поездами'.freeze
  LIST_OF_TRAINS_MESSAGE = 'Общий список поездов:'.freeze
  FOLLOWING_STATIONS_ROUTE = 'Для составления маршрута доступны следующие станции:'.freeze
  CREATE_STATIONS_OR_CURRENT = 'Вы хотите создать новую cтанцию или продолжить с текущими?'.freeze
  SEPARATOR_STRING = '==='.freeze
  ADD_ROUTE_STATION = 'Добавить станцию маршрута?'.freeze
  STATION_STRING = 'Станция '.freeze
  STATION_MANAGEMENT = 'Управление станциями:'.freeze
  TRAIN_MANAGEMENT = 'Управление станциями:'.freeze
  SELECT_NUMBER = 'Выберите номер :'.freeze
  ENTER_NAME_MANUFACTURER = 'Введите название производителя: '.freeze
  ENTER_NUMBER_WAGON_TRAIN = 'Введите номер вагона поезда: '.freeze
  ENTER_NUMBER_WAGON_FROM_LIST = 'Введите номер поезда из списка:'.freeze

  TO_EXIT_APPLICATION_0 = '0 - для выхода из приложения'.freeze

  EXIT = 0
  EXIT.freeze

  ENTER_WAGON_VOLUME = 'Введите объём вагона:'.freeze
  ENTER_WAGON_SEATS = 'Введите количество пассажирских мест'.freeze
  SEAT_SUCCESSFULLY_TAKEN = 'Бронирование места прошло успешно.'.freeze
  VOLUME_SUCCESSFULLY_TAKEN = 'Объём успешно забронирован.'.freeze

  # Прочие вспомогательные методы:
  def choices_list(*options, extra_lines)
    puts 'Введите:'
    number = 1
    options[0].each do |option|
      puts "#{number} - #{option}"
      number += 1
    end

    # '0 - для выхода из приложения'
    puts TO_EXIT_APPLICATION_0 if extra_lines
    print '> ' if extra_lines
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
    choices_list(ROUTE_MENU_LIST, false)
  end

  def stations_menu_intro
    puts SEPARATOR_STRING
    puts STATION_MANAGEMENT # 'Управление станциями:'
  end

  def trains_menu_intro
    puts SEPARATOR_STRING
    puts TRAIN_MANAGEMENT # 'Управление поездами:'
  end

  def manufacturer_name_message
    puts ENTER_NAME_MANUFACTURER # 'Введите название производителя: '
  end

  def enter_number_wagon_message
    puts ENTER_NUMBER_WAGON_TRAIN # 'Введите номер вагона поезда: '
  end

  def train_created_message(number)
    blank_line
    puts "Поезд #{number} успешно создан."
  end

  def station_created_message(name)
    blank_line
    puts "Станция #{name} успешно создана."
  end

  def route_created_message
    blank_line
    puts 'Маршрут успешно создан.'
  end
end
