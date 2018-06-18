class BankAccount

  DEFAULT_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def deposit(date, amount)
    @balance += amount
  end

  def withdraw(date, amount)
    @balance -= amount
  end

end
