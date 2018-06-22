# frozen_string_literal: true

require './lib/transaction'
require './lib/printer'

class BankAccount
  DEFAULT_BALANCE = 0

  attr_reader :balance, :bank_statement

  def initialize(transaction_class: Transaction, printer_class: Printer)
    @balance = DEFAULT_BALANCE
    @bank_statement = []
    @transaction_class = transaction_class
    @printer_class = printer_class
  end

  def deposit(date, credit)
    update_balance(date, credit: credit)
  end

  def withdraw(date, debit)
    raise 'Insufficient funds' if balance_is_zero?
    update_balance(date, debit: debit)
  end

  def print_statement
    printer = @printer_class.new
    printer.print_format(@bank_statement)
  end

  private

  def update_balance(date, credit: nil, debit: nil)
    @balance += credit if credit
    @balance -= debit if debit
    create_transaction(date, credit, debit, @balance)
  end

  def create_transaction(date, credit, debit, balance)
    transaction = @transaction_class.new(date, credit, debit, balance)
    @bank_statement << transaction
  end

  def balance_is_zero?
    @balance.zero?
  end
end
