puts "Пожалуйста, введите Ваше имя: "
you_name = gets.chomp.capitalize

puts "Пожалуйста, введите Ваш рост:"
you_height = gets.to_i

you_perfect_weight = you_height - 110

if you_perfect_weight < 0
  puts "Ваш вес уже оптимальный."
else
  puts "#{you_name}, Ваш идеальный вес: #{you_perfect_weight}"
end
