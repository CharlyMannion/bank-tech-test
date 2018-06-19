# frozen_string_literal: true

require './lib/bank_account'

describe BankAccount do

  subject(:account) { described_class.new(transaction_class: fake_transaction_class) }

  let(:fake_transaction_class) { double(:fake_transaction_class, new: transaction) }
  let(:transaction) { double(:transaction) }

  describe '#initialize' do
    it 'should have a default balance of nil' do
      expect(account.balance).to eq BankAccount::DEFAULT_BALANCE
    end
    it 'should have a bank statement' do
      expect(account.bank_statement).to eq([])
    end
  end

  describe '#deposit' do
    before do
      account.deposit('10-01-2012', 1000)
    end
    it 'should increase the bank balance by the specified amount' do
      expect(account.balance).to eq 1000
    end
    it 'should create a transaction' do
      expect(fake_transaction_class).to have_received(:new).with('10-01-2012', 1000, 1000)
    end
    it 'should be recorded in the bank statement' do
      expect(account.bank_statement).to include(transaction)
    end
  end

  describe '#withdraw' do
    before do
      account.withdraw('14-01-2012', 500)
      p account.balance
    end
    it 'should reduce the bank balance by the specified amount' do
      expect(account.balance).to eq -500
    end
    it 'should create a transaction' do
      expect(fake_transaction_class).to have_received(:new).with('14-01-2012', 1000, -500)
    end
  end
end
