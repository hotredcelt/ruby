def put_data
  puts 'Введите число и слово:'
  words = gets.chomp
  words = words.split(" ")
  word = words[1]

  if word[word.length - 2, word.length - 1].upcase == "CS"
    puts 2 ** word.length
  else
    puts word.reverse
  end

end

def pokemon_processor
  pokemons =[]
  puts 'Введите количество покемонов:'
  number = gets.to_i
  number.times do
    puts 'Имя покемона:'
    name1 = gets.chomp
    puts 'Цвет:'
    color1 = gets.chomp
    pokemons << {'Имя' => name1, 'Цвет' => color1}
  end
  puts 'Массив'
  puts pokemons
end
def menu
  loop do
    puts '1. Строка.'
    puts '2. Покемоны.'
    puts '3. Выход.'
    puts "\n"


    choose = gets.to_i
    case choose
    when 1
      put_data
    when 2
      pokemon_processor
    when 3
      break
    else
      puts "Введен неправильный вариант."
    end
  end
end

menu