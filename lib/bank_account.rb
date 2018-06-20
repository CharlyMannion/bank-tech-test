# frozen_string_literal: true

require './lib/transaction'

class BankAccount
  DEFAULT_BALANCE = 0

  attr_reader :balance, :bank_statement

  def initialize(transaction_class: Transaction, formatted_statement_class: FormattedStatement)
    @balance = DEFAULT_BALANCE
    @bank_statement = []
    @transaction_class = transaction_class
    @formatted_statement_class = formatted_statement_class
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
  #   formatted_statement = @formatted_statement_class.new(@bank_statement)
  #   formatted_statement
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
