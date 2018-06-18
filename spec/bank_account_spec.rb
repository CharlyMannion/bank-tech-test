require './lib/bank_account'

describe BankAccount do

  describe '#initialize' do
    it 'should have a default balance of nil' do
      account = BankAccount.new
      expect(account.balance).to eq BankAccount::DEFAULT_BALANCE
    end
  end

  describe '#deposit' do
    it 'should increase the bank balance by the specified amount' do
      account = BankAccount.new
      account.deposit("10-01-2012", 1000)
      expect(account.balance).to eq 1000
    end
  end

  describe '#withdraw' do
    it 'should reduce the bank balance by the specified amount' do
      account = BankAccount.new
      account.deposit("10-01-2012", 1000)
      account.deposit("13-01-2012", 2000)
      account.withdraw("14-01-2012", 500)
      expect(account.balance).to eq 2500
    end
  end

end
