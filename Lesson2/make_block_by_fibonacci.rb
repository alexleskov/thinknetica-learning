#Заполнить массив числами фибоначчи до 100

massif = [0,1]
n = 2

until massif.last >= 100 do
  massif << massif[n-1] + massif[n-2]
  n += 1
end

massif.delete_if {|number| number > 100 }

puts "Massif: #{massif}"
