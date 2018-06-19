# Идеальный вес

const_height = 110

puts "Как вас зовут?"
name = gets.capitalize!

puts "Какой у вас рост?"
height = gets.to_f

ideal_weight = height - const_height

if ideal_weight > 0
  puts "#{name}, ваш идеальный вес = #{ideal_weight}"
  
else
  puts "#{name}, ваш текущий вес уже считается идеальным"
end
