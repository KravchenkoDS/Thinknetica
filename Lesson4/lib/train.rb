class Train
  attr_reader :type, :speed, :route, :wagons, :name

  def initialize(name, type)
    @name = name
    @type = type
    @speed = 0
    @wagons = []
  end

  def increase_speed(speed)
    @speed += speed if speed > 0
  end

  def decrease_speed(speed)
    if @speed - speed < 0
      @speed  = 0
    else
      @speed -= speed
    end
  end

  def stop
    @speed = 0
  end

  def add_wagon(wagon)
    @wagons << wagon if attachable_wagon?(wagon)
  end

  def remove_wagon(remove_wagon)
    # Удаление только из массива @wagons для поезда, вагон продолжает существовать
    # в массиве с аналогичном названием в MainMenu.
    @wagons.reject! { |wagon| wagon.number == remove_wagon }
  end

  def set_route(route)
    @route = route
    @current_station_index = 0
    route.first_station.accept_train(self)
  end

  def move_to_next_station
    if next_station
      current_station.send_train(self)
      next_station.accept_train(self)
      @current_station_index += 1
    end
  end

  def move_to_previous_station
    if previous_station
      current_station.send_train(self)
      previous_station.accept_train(self)
      @current_station_index -= 1
    end
  end

  protected

=begin
  Три метода поиска станций не должны быть открыты для кода извне, вызов
  только внутри методов объекта класса, и используются
  в наследуемых классах (CargoTrain, PassengerTrain) - protected
=end
  def current_station
    route.stations[@current_station_index]
  end

  def previous_station
    route.stations[@current_station_index - 1] unless @current_station_index == 0
  end

  def next_station
    route.stations[@current_station_index + 1]
  end
end
