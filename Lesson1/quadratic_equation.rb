# Квадратное уравнение

puts "Введите коэффициент a:"
a = gets.to_f

puts "Введите коэффициент b:"
b = gets.to_f

puts "Введите коэффициент c:"
c = gets.to_f

if a == 0 || b == 0 || c == 0
  abort "Введены некорректные значения коэффициентов."
end

d = b**2 - 4 * a * c

abort "D = #{d}, корней нет!" if d < 0

if d == 0
  x1 = -b / (2 * a)
  puts "D = #{d}, X = #{x1}"
elsif d > 0
  sqrt_d = Math.sqrt(d)
  x1 = (-b + sqrt_d) / (2 * a)
  x2 = (-b - sqrt_d) / (2 * a)
  puts "D = #{d}, X1 = #{x1}, X2 = #{x2}"
end
