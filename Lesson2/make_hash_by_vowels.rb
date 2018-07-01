#Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ('a'..'z')
vowels = ['a','e','i','o','u']
hash = {}

alphabet.each.with_index(1) do |letter, index|
  hash[letter] = index if vowels.include? letter
end

puts "Hash: #{hash}"
