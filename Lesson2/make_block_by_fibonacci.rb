#Заполнить массив числами фибоначчи до 100

massif = [0,1]

for n in 2..100
  massif.push(massif[n-1] + massif[n-2])
end

puts "massif: #{massif}"
