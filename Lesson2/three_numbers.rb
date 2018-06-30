# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

count_days = 0

puts "Введите число:"
day = gets.to_i

puts "Введите месяц:"
month = gets.to_i

puts "Введите год:"
year = gets.to_i

months[1] = 29 if year % 4 == 0 && year % 100 != 0 || year % 400 == 0

months.first(month - 1).each do |month_days|
  count_days += month_days
end

count_days += day

puts "Порядковый номер даты #{day}.#{month}.#{year}: #{count_days}"
