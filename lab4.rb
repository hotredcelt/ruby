class ATM

  def initialize
    @balance = 100.0
    if File.exist?("balance.txt")
      f = File.open("balance.txt")
      @balance = f.read.to_f
      f.close
    end
  end

  def deposit(cash)
    if cash <= 0
      puts 'Сумма должна быть больше нуля'
    else
      @balance += cash
      puts "Ваш новый баланс: #{@balance}"
    end
  end

  def withdraw(cash)
    if cash <= 0
      puts 'Сумма должна быть больше нуля'
    elsif cash > @balance
      puts 'Недостаточно средств'
    else
      @balance -= cash
      puts "Ваш новый баланс: #{@balance}"
    end
  end

  def balance
    puts "Ваш баланс: #{@balance}"
  end

  def quit
    f = File.open('balance.txt', 'w')
    f.write(@balance)
    f.close
  end
end

cash_dispenser = ATM.new

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
    cash_dispenser.deposit(gets.to_f)
  when 'w'
    puts 'Введите сумму для списания'
    cash_dispenser.withdraw(gets.to_f)
  when 'b'
    cash_dispenser.balance
  when 'q'
    cash_dispenser.quit
    break
  else
    puts 'Нет такого варианта'
  end
end
