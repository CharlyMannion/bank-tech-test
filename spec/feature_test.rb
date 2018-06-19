# frozen_string_literal: true

# irb -r './spec/feature_test.rb'

require './lib/bank_account'

def create_new_account
  account = BankAccount.new
  p account
end

def check_default_balance
  account = BankAccount.new
  p account.balance
end

def deposit_money
  account = BankAccount.new
  account.deposit('10-01-2012', 1000)
  p account.balance
end

def withdraw_money
  account = BankAccount.new
  account.deposit('10-01-2012', 1000)
  account.deposit('13-01-2012', 2000)
  account.withdraw('14-01-2012', 500)
  p account.balance
end

def view_balance
  account = BankAccount.new
  account.deposit('10-01-2012', 1000)
  account.deposit('13-01-2012', 2000)
  account.withdraw('14-01-2012', 500)
  p account.balance
end

def has_bank_statement
  account = BankAccount.new
  account.deposit('10-01-2012', 1000)
  account.deposit('13-01-2012', 2000)
  account.withdraw('14-01-2012', 500)
  p account
end

# def create_bank_statement
#   bank_statement = BankStatement.new
# end

def despositing_adds_transaction_to_bank_statement
  account = BankAccount.new
  account.deposit('10-01-2012', 1000)
  p account
  p account.bank_statement
end

def initialize_transaction
  transaction = Transaction.new
end

# create_new_account
# check_default_balance
# deposit_money
# withdraw_money
# view_balance
# has_bank_statement
despositing_adds_transaction_to_bank_statement
initialize_transaction

# irb -r './spec/feature_test.rb'
