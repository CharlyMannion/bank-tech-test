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

end
