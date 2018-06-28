# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.

months = {
  1 => {title: 'january', days: 31},
  2 => {title: 'february', days: 28},
  3 => {title: 'march', days: 31},
  4 => {title: 'april', days: 30},
  5 => {title: 'may', days: 31},
  6 => {title: 'june', days: 30},
  7 => {title: 'july', days: 31},
  8 => {title: 'august', days: 31},
  9 => {title: 'september', days: 30},
  10 => {title: 'october', days: 31},
  11 => {title: 'november', days: 30},
  12 => {title: 'december', days: 31}
}

year_normal = 365
count_days = 0
last_month = months.length

puts "Введите число:"
day = gets.to_i

puts "Введите месяц:"
month = gets.to_i

puts "Введите год:"
year = gets.to_i

for i in month..last_month
  count_days = (months[i][:days] + count_days)
end

count_days = (year_normal - count_days) + day

if month >= 2 && day > 28
  count_days += 1 if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
end

puts "Порядковый номер даты #{day}.#{month}.#{year}: #{count_days}"
