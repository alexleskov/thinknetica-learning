#Заполнить массив числами фибоначчи до 100

massif = [0, 1]
number = 1

until number >= 100
  massif << number
  number = massif[-1] + massif[-2]
end

puts "Massif: #{massif}"
