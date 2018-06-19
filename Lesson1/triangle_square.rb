# Площадь треугольника

puts "Введите основание треугольника:"
main_side = gets.to_f

puts "Введите высоту треугольника:"
height = gets.to_f

triangle_square = 0.5 * main_side * height

if main_side <= 0 || height <= 0
  puts "Введённые данные не корректны для вычисления площади треугольника."
else
  puts "Площадь треугольника с основанием #{main_side} и высотой #{height} = #{triangle_square}"
end
