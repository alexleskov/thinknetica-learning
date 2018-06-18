# Квадратное уравнение

puts "Введите коэффициент a:"
a = gets.chomp.to_i

puts "Введите коэффициент b:"
b = gets.chomp.to_i

puts "Введите коэффициент c:"
c = gets.chomp.to_i

if a != 0 && b != 0 && c !=0

D = b**2 - 4*a*c

  if D<0
    puts "D = #{D}, корней нет!"

  elsif D==0
    x1 = (-b+Math.sqrt(D))/2*a
    puts "D = #{D}, X = #{x1}"

  elsif D>0
    x1 = (-b+Math.sqrt(D))/2*a
    x2 = (-b-Math.sqrt(D))/2*a
    puts "D = #{D}, X1 = #{x1}, X2 = #{x2}"

  end

else
  puts "Введены некорректные значения коэффициентов."

end
