sides = []
def right_triangle(sides)

  return "Треугольник равносторонний, но не является прямоугольным." if sides.uniq.length == 1

  a, b, c = sides.sort # Порядок ввода межет быть произвольным.

  if a == b && a**2 + b**2 == c**2
    "Треугольник является прямоугольным и равнобедренным."
  elsif a**2 + b**2 == c**2
    "Треугольник является прямоугольным."
  else
    "Треугольник не является прямоугольным."
  end
end

3.times do

  puts "Пожалуйста, введите сторону треугольника: "
  sides << gets.to_f
  
end


puts right_triangle(sides)