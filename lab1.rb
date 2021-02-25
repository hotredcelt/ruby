def hello

  puts 'Введите своё имя:'
  name = gets.chomp

  puts 'Введите свою фамилию:'
  last_name = gets.chomp

  puts 'Введите свoй возраст:'
  age = gets.to_i

  if age < 18
    puts "Привет, #{name} #{last_name}. Тебе меньше 18 лет, но начать программировать никогда не поздно"
  else
    puts "Привет, #{name} #{last_name}. Самое время заняться делом"
  end
end

def compareNums (a, b)
  if (a == 20) || (b == 20)
    20
  else
    a+b
  end
end

def menu
  loop do
    puts '1. Приветствие.'
    puts '2. Проверка чисел.'
    puts '-1. Выход.'
    puts "\n"


    choose = gets.to_i
    case choose
    when 1
      hello
    when 2
      puts 'Введите первое число:'
      a = gets.to_i

      puts 'Введите второе число:'
      b = gets.to_i
      
      puts "Результат: #{compareNums(a, b)}"
    when -1
      break
    else
      puts "Введен неправильный вариант."
    end
  end
end

menu
