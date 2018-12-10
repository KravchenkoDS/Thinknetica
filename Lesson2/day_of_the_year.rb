def days_in_february(year)
  if year % 400 == 0
    29
  elsif year % 4 == 0 && year % 100 != 0
    29
  else
    28
  end
end

puts "Пожалуйста, введите число: "
day = gets.to_i
puts "Пожалуйста, введите номер месяца: "
month = gets.to_i
puts "Пожалуйста, введите год: "
year = gets.to_i

days_in_month = [31, days_in_february(year), 30, 31, 30, 31, 30, 31, 30, 31, 30] # Декабрь - не имеет значения
puts days_in_month.first(month - 1).sum(day)
