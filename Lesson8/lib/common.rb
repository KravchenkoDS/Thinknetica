require_relative 'menu_items'

module Common
  include MenuItems

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

  def space_type(type)
    if type == :cargo
      { available_space: 'свободного объёма', reserved_space: 'занятого объёма' }
    else
      { available_space: 'свободных мест', reserved_space: 'занятых мест' }
    end
  end

  def wagon_info(wagon)
    output_type = space_type(wagon.type)
    puts "Вагон номер: #{wagon.number}"
    puts "Количество #{output_type[:available_space]}: #{wagon.available_space},
      количество #{output_type[:reserved_space]}: #{wagon.reserved_space}"
  end

  def manage_wagon(wagon)
    wagon_info(wagon)
    choices_list(RESERVE_SPACE, true)
    loop do
      case gets.to_i
      when 1
        user_input_seats(wagon)
        break
      when 2
        break
      else
        enter_another_value
      end
    end
  end

  def user_taken_seats_volume(wagon)
    if wagon.is_a?(CargoWagon)
      puts ENTER_WAGON_VOLUME
      volume = gets.to_i
      wagon.reserve_space(volume)
    else
      wagon.reserve_space
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def successfully_taken(wagon)
    puts wagon.type == :cargo ? VOLUME_SUCCESSFULLY_TAKEN : SEAT_SUCCESSFULLY_TAKEN
  end

  def user_input_seats(wagon)
    user_taken_seats_volume(wagon)
    successfully_taken(wagon)
  end

  def select_wagon(number, wagons)
    wagons.detect { |wagon| wagon.number == number }
  end

  def add_wagon_train(train)
    enter_number_wagon_message
    number = gets.to_i
    wagon = create_wagon_train(train, number)
    train.add_wagon(wagon)
    add_wagon(wagon)
  end

  def remove_wagon_train(train)
    enter_number_wagon_message
    print_wagons_in_train(train)
    wagon = select_from_list(train.wagons)
    train.remove_wagon(wagon)
    print_wagons_in_train(train)
  end
end
