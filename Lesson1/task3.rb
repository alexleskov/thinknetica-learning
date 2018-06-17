#Прямоугольный треугольник

pifagor_power = 0
pifagor_side1 = 0
pifagor_side2 = 0
gipotinuza = 0

puts "Введите сторону 1:"
side1 = gets.chomp.to_i

puts "Введите сторону 2:"
side2 = gets.chomp.to_i

puts "Введите сторону 3:"
side3 = gets.chomp.to_i

if side1 > 0 && side2 > 0 && side3 > 0

  if side1 == side2 && side2 == side3

    puts "Этот замечательный треугольник идеален как кусок итальянской пиццы - он равносторонний и равнобедренный."

  elsif side1 > side2 && side1 > side3
    gipotinuza = side1
    pifagor_side1 = side2
    pifagor_side2 = side3

  elsif side2 > side1 && side2 > side3
    gipotinuza = side2
    pifagor_side1 = side1
    pifagor_side2 = side3

  else
    gipotinuza = side3
    pifagor_side1 = side1
    pifagor_side2 = side2

  end

  pifagor_power = pifagor_side1**2 + pifagor_side2**2
  gipotinuza_2 = gipotinuza**2


  unless pifagor_side1 == 0 || pifagor_side2 == 0

    if pifagor_power == gipotinuza_2 && pifagor_side1 == pifagor_side2
      puts "Шок! Этот треугольник оказался не так уж и прост - он не только прямоугольный, но и равнобедренный."

    elsif pifagor_power == gipotinuza_2
      puts "Ваш треугольник оказался прямоугольным, поздравляю! Пифагор бы Вами гордился."

    elsif pifagor_side1 == pifagor_side2
      puts "Ваш треугольник просто равнобедренный."

    else puts "Ваш треугольник не прямоугольный, не равнобедренный и не равносторонний."
    end


  end

else

  puts "Ваши входные данные некорректны! Это не треугольник."

end
