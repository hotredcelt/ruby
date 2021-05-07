def t1
  file = File.open('input.txt')
  peoples= file.readlines.map { |line|line.chomp }
  #peoples = file.read.split("\n")
  file.close
  result = []

  loop do
    puts 'Введите возраст'
    input = gets.to_i
    break if input == -1 #для выхода ввести -1

    peoples.each { |people|
      result.append(people) if people.split(' ')[2].to_i == input
    }
    break if peoples.length == result.length
  end

  file = File.open('result.txt', 'w')
  result.each { |s|
    puts s

    file.write(s + "\n")
  }
  file.close
end


def t2
  money = 100.0
  if File.exist?("balance.txt") #проверка существования файла
    f = File.open("balance.txt")
    money = f.read.to_f
    f.close
  end
  loop do

    puts "
  (B) Баланс
  (D) Депозит
  (W) Вывод
  (Q) Quit"

    choose = gets.chomp

    case choose.downcase
    when 'd'
      puts 'Введите сумму для депозита'
      sum = gets.to_f
      if sum <= 0
        puts 'Сумма должна быть больше нуля'
      else
        money += sum
        puts "Ваш новый баланс: #{money}"
        f = File.open('balance.txt', 'w')
        f.write(money)
      end
    when 'w'
      puts 'Введите сумму для списания'
      sum = gets.to_f
      if sum <= 0
        puts 'Сумма должна быть больше нуля'
      elsif sum > money
        puts 'Недостаточно средств'
      else
        money -= sum
        puts "Ваш новый баланс: #{money}"
      end
      f = File.open('balance.txt', 'w')
      f.write(money)
    when 'b'
      puts "Ваш баланс: #{money}"
    when 'q'
      f = File.open('balance.txt', 'w')
      f.write(money)
      f.close
      break
    else
      puts 'Некоректно выбран пункт меню'
    end
  end
end

def menu
  loop do
    puts '1. Задание 1'
    puts '2. Задание 2'
    puts '0. Выход'

    choose = gets.to_i
    case choose
    when 1
      t1
    when 2
      t2

    when 0
      break
    else
      puts 'Нет такого варианта'
    end
  end
end

menu
