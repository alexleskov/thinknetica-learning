# Идеальный вес

const_height = Integer(110)

puts "Как вас зовут?"

name = gets.chomp.capitalize!

puts "Какой у вас рост?"

height = gets.chomp.to_i

ideal_weight = height - const_height

if ideal_weight > 0
  puts "#{name}, ваш идеальный вес = #{ideal_weight}"
else

  puts "#{name}, ваш текущий вес уже считается идеальным"

end
