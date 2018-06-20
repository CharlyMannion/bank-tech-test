# frozen_string_literal: true

require './lib/transaction'
require './lib/printer'

class BankAccount
  DEFAULT_BALANCE = 0

  attr_reader :balance, :bank_statement

  def initialize(transaction_class: Transaction)
    @balance = DEFAULT_BALANCE
    @bank_statement = []
    @transaction_class = transaction_class
    @printer = Printer.new
  end

  def deposit(date, amount)
    update_balance(amount)
    create_transaction(date, amount, @balance)
  end

  def withdraw(date, amount)
    update_balance(-amount)
    create_transaction(date, amount, @balance)
  end

  def print_statement
    @printer.print_format(@bank_statement)
  end

  private

  def update_balance(amount)
    @balance += amount
  end

  def create_transaction(date, amount, balance)
    transaction = @transaction_class.new(date, amount, balance)
    @bank_statement << transaction
  end
end
