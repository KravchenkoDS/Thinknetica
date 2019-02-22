require_relative 'menu_items'
require_relative 'print_objects'

module Common
  include MenuItems
  include PrintObjects

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
    loop do
      choices_list(RESERVE_SPACE, false)
      case gets.to_i
      when 1 then user_input_seats(wagon)
      when 2 then return
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
    wagon_info(wagon)
  end

  def user_input_seats(wagon)
    user_taken_seats_volume(wagon)
    successfully_taken(wagon)
  end

  def station_exist?(name)
    !!@stations.detect { |station| station.name == name }
  end

  def train_exist?(number)
    !!@trains.detect { |train| train.number == number }
  end

  def select_from_list(array)
    puts SELECT_NUMBER
    number = gets.to_i
    array[number]
  end
end
