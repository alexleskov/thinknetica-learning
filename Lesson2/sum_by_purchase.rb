#Сумма покупок

bill = {}
stop_phrase = 'Стоп'
product_num = 0
summary = 0

loop do
  puts "Название товара:"
  product_name = gets.chomp.capitalize!

  break if product_name == stop_phrase

  puts "Цена за единицу:"
  cost_by_one = gets.to_f

  puts "Количество товара:"
  product_count = gets.to_i

  bill[product_name] = { cost: cost_by_one, count: product_count }
end

bill.each do |product_name, properties|
  total = properties[:cost] * properties[:count]
  puts "Товар: #{product_name}, Цена: #{properties[:cost]}, Кол-во: #{properties[:count]}"
  puts "Итого: #{total}"
  puts "-------------------------------------------------"
  summary += total
end

puts "Итого всего: #{summary}"
