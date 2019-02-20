module MenuItems
  SHOW_MENU_LIST = [
    'управление станциями',
    'управление поездами',
    'управление маршрутами'
  ].freeze

  STATIONS_MENU_LIST = [
    'создание станции',
    'список станций',
    'вернуться в корневое меню'
  ].freeze

  TRAINS_MENU_LIST = [
    'создать новый поезд',
    'назначить маршрут поезду',
    'управление вагонами',
    'переместить поезд по маршруту',
    'открыть список станций и поездов',
    'вернуться в корневое меню'
  ].freeze

  WAGON_MENU_LIST = [
    'создать новый вагон',
    'вернуться в корневое меню'
  ].freeze

  WAGON_ADD_UNHOOK_MENU_LIST = [
    'добавить вагон',
    'отцепить вагон',
    'список вагонов',
    'зарезервировать место в вагоне',
    'вернуться в корневое меню'
  ].freeze

  RESERVE_SPACE = [
    'забронировать место',
    'завершить бронирование'
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
    'продолжить с текущими',
    'вернуться в корневое меню'
  ].freeze

  ROUTE_MENU_LIST = [
    'создать маршрут',
    'добавить станцию в маршрут',
    'удалить станцию из маршрута',
    'список маршрутов',
    'вернуться в корневое меню'
  ].freeze

  MOVE_TRAIN_MENU_LIST = [
    'отправить на следующую станцию',
    'отправить на предыдущую станцию',
    'вернуться в корневое меню'
  ].freeze

  YES_NO = [
    'Да',
    'Нет',
    'вернуться в корневое меню'
  ].freeze

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
end
