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
  account.deposit("10-01-2012", 1000)
  p account.balance
end

create_new_account
check_default_balance
deposit_money

# irb -r './spec/feature_test.rb'
