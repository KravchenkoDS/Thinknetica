def triangle_area(area, height)
  0.5 * area * height
end

puts "Пожалуйста, введите основание треугольника: "
area = gets.to_f

puts "Пожалуйста, введите высоту треугольника: "
height = gets.to_f

puts "Площадь треугольника равна: #{triangle_area(area, height)}"