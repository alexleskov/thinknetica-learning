#Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ('a'..'z')
vowels = ['a','e','i','o','u']
hash = {}

alphabet.each.with_index(1) { |letter, index|
  hash[letter] = index if vowels.include? letter
}

puts "Hash: #{hash}"
