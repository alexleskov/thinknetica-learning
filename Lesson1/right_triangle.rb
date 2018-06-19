#Прямоугольный треугольник

puts "Введите сторону 1:"
side1 = gets.to_f

puts "Введите сторону 2:"
side2 = gets.to_f

puts "Введите сторону 3:"
side3 = gets.to_f

abort "Ваши входные данные некорректны! Это не треугольник." if side1 <= 0 || side2 <= 0 || side3 <= 0

abort "Этот замечательный треугольник идеален как кусок итальянской пиццы - он равносторонний и равнобедренный." if side1 == side2 && side2 == side3

sides = [side1, side2, side3]
sides.sort!

pifagor_power = sides[0]**2 + sides[1]**2
sides[2] = sides[2]**2

rectangular = pifagor_power == sides[2]

if rectangular && sides[0] == sides[1]
  puts "Шок! Этот треугольник оказался не так уж и прост - он не только прямоугольный, но и равнобедренный."
elsif rectangular
  puts "Ваш треугольник оказался прямоугольным, поздравляю! Пифагор бы Вами гордился."
elsif sides[0] == sides[1]
  puts "Ваш треугольник просто равнобедренный."
else
  puts "Ваш треугольник не прямоугольный, не равнобедренный и не равносторонний."
end
