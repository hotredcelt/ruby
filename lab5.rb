require 'socket'

server = TCPServer.new(3060)

class CashMachine
  def initialize
    @balance = 420.0
  end

  def withdraw(sum)
    if sum <= 0
      'Ошибка отрицательной суммы'
    elsif sum > @balance
      'У вас мало деняк'
    else
      @balance -= sum
      "Баланс: #{@balance}"
    end
  end

  def deposit(sum)
    if sum <= 0
      'Ошибка отрицательной суммы'
    else
      @balance += sum
      "New balance: #{@balance}"
    end
  end

  def balance
    "Ваш баланс: #{@balance} \n"
  end

end

while (connection = server.accept)

  cashmachine = CashMachine.new

  request = connection.gets
  nothing, full_path = request.split(' ')
  path = full_path.split('/')[1]
  next unless nothing == 'GET'
  if full_path.split('/')[1].include?('?')
    method = path.split('?')[0]
    value = path.split('?')[1].split('=')[1].to_i
  end

  connection.print "HTTP/1.1 200\r\n"
  connection.print "Content-Type: text/html\r\n"
  connection.print "\r\n"
  connection.print cashmachine.balance if path == 'balance'

  next if value.nil?
  connection.print case method
                   when 'deposit'
                     cashmachine.deposit(value)
                   when 'withdraw'
                     cashmachine.withdraw(value)
                   else
                     'error'
                   end

end
