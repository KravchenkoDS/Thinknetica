module PrintObjects
  def print_stations_and_trains
    @stations.each do |station|
      if !station.trains.empty?
        trains = []
        station.trains.each do |train|
          trains << train.number
        end
        puts "Станция #{station.name}, поезда: #{trains.join(', ')}"
      else puts "Станция #{station.name}"
      end
    end
  end

  def print_stations_in_route(route)
    route.stations.each_with_index do |stations, index|
      puts "#{index} - Наименование станции - #{stations.name}"
    end
  end

  def print_wagons_in_train(train)
    train.wagons.each_with_index do |wagon, index|
      puts "#{index} - Номер вагона #{wagon.number}"
    end
  end

  def wagons_list(train)
    puts "Список вагонов поезда #{train.number}:"
    train.wagons.each_with_index do |wagon, _index|
      wagon_info(wagon)
    end
  end

  def stations_list
    @stations.each_with_index do |stations, index|
      puts "#{index} - Наименование станции - #{stations.name}"
    end
    blank_line
  end

  def routes_list
    routes = []
    @routes.each do |route|
      routes << "Маршрут номер #{@routes.index(route)}"
    end
    blank_line
    puts routes.join(', ')
  end

  def trains_list
    @trains.each_with_index do |train, index|
      print "#{index} - Наименование поезда - #{train.number}"
      print ", тип: #{train.type}"
      puts ", количество вагонов: #{train.wagons.size}"
    end
  end
end
