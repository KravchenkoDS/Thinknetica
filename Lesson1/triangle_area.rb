def triangle_area(base, height)
  0.5 * base * height
end

puts "Пожалуйста, введите основание треугольника: "
base = gets.to_f

puts "Пожалуйста, введите высоту треугольника: "
height = gets.to_f

puts "Площадь треугольника равна: #{triangle_area(base, height)}"
