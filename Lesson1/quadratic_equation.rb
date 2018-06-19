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

D = b**2 - 4 * a * c

if D < 0
  abort "D = #{D}, корней нет!"
end

sqrt_D = Math.sqrt(D)

if D == 0
  x1 = (-b + sqrt_D) / 2 * a
  puts "D = #{D}, X = #{x1}"

elsif D > 0
  x1 = (-b + sqrt_D) / 2 * a
  x2 = (-b - sqrt_D) / 2 * a
  puts "D = #{D}, X1 = #{x1}, X2 = #{x2}"
end
