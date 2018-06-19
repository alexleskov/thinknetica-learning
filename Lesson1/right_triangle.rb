#Прямоугольный треугольник

puts "Введите сторону 1:"
side1 = gets.to_f

puts "Введите сторону 2:"
side2 = gets.to_f

puts "Введите сторону 3:"
side3 = gets.to_f

if side1 <= 0 || side2 <= 0 || side3 <= 0
  abort "Ваши входные данные некорректны! Это не треугольник."
end

if side1 == side2 && side2 == side3
  abort "Этот замечательный треугольник идеален как кусок итальянской пиццы - он равносторонний и равнобедренный."
end

Sides = [side1, side2, side3]
Sides.sort! {|x,y| x <=> y }

gipotinuza = Sides[2]
pifagor_side1 = Sides[0]
pifagor_side2 = Sides[1]

pifagor_power = pifagor_side1**2 + pifagor_side2**2
gipotinuza_2 = gipotinuza**2

if pifagor_power == gipotinuza_2 && pifagor_side1 == pifagor_side2
  puts "Шок! Этот треугольник оказался не так уж и прост - он не только прямоугольный, но и равнобедренный."

elsif pifagor_power == gipotinuza_2
  puts "Ваш треугольник оказался прямоугольным, поздравляю! Пифагор бы Вами гордился."

elsif pifagor_side1 == pifagor_side2
  puts "Ваш треугольник просто равнобедренный."

else
  puts "Ваш треугольник не прямоугольный, не равнобедренный и не равносторонний."
end
