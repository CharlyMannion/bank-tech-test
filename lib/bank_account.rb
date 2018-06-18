# frozen_string_literal: true

class BankAccount
  DEFAULT_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def deposit(_date, amount)
    @balance += amount
  end

  def withdraw(_date, amount)
    @balance -= amount
  end
end
