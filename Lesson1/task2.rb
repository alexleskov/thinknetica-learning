# Площадь треугольника

puts "Введите основание треугольника:"

a = gets.chomp.to_i

puts "Введите высоту треугольника:"

h = gets.chomp.to_i

triangle_square = (0.5*a)*h

if a == 0 || h == 0

  puts "Не хватает данных для вычисления площади треугольника"

else

puts "Площадь треугольника с основанием #{a} и высотой #{h} = #{triangle_square}"

end
