sides = []
def right_triangle(sides)
  a, b, c = sides.sort # Порядок ввода может быть произвольным, сортировка значений
  return "Треугольник равносторонний, но не является прямоугольным." if a = c

  exponentiation_comparasion_a_b_c = a**2 + b**2 == c**2

  if a == b && exponentiation_comparasion_a_b_c
    "Треугольник является прямоугольным и равнобедренным."
  elsif exponentiation_comparasion_a_b_c
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
