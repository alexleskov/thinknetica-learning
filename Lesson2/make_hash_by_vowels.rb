#Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ('a'..'z')
vowels = ['a','e','i','o','u']
hash = Hash.new
number = 0

for letter in alphabet
  number += 1
  hash[letter] = number if vowels.include? letter
end

puts "Hash: #{hash}"
