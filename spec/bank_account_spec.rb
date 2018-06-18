require './lib/bank_account'

describe BankAccount do

  describe '#initialize' do
    it 'should have a default balance of nil' do
      account = BankAccount.new
      expect(account.balance).to eq BankAccount::DEFAULT_BALANCE
    end
  end

end