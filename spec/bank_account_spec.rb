# frozen_string_literal: true

require './lib/bank_account'

describe BankAccount do
  subject(:account) { described_class.new }

  describe '#initialize' do
    it 'should have a default balance of nil' do
      expect(account.balance).to eq BankAccount::DEFAULT_BALANCE
    end
  end

  describe 'tests that require a despoit of 1000 to have been made' do
    before do
      account.deposit('10-01-2012', 1000)
    end
    describe '#deposit' do
      it 'should increase the bank balance by the specified amount' do
        expect(account.balance).to eq 1000
      end
    end
    describe '#withdraw' do
      it 'should reduce the bank balance by the specified amount' do
        account.withdraw('14-01-2012', 500)
        expect(account.balance).to eq 500
      end
    end
  end
end
