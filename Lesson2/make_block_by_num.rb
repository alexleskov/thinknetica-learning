#Заполнить массив числами от 10 до 100 с шагом 5

massif = []

for i in 10..100
  massif.push(i) if i % 5 == 0
end

puts "massif: #{massif}"
