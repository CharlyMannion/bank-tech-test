# frozen_string_literal: true

require './lib/bank_account'

describe BankAccount do
  subject(:account) { described_class.new(transaction_class: fake_transaction_class) }
  let(:fake_transaction_class) { double(:fake_transaction_class, new: transaction) }
  let(:transaction) { double(:transaction, date: "10/01/2012", amount: "1000.00", balance: "1000.00") }
  let(:printer) { double(:printer) }

  it 'should respond to print_statement' do
    expect(account).to respond_to(:print_statement)
  end

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
    end
    it 'should reduce the bank balance by the specified amount' do
      expect(account.balance).to eq -500
    end
    it 'should create a transaction' do
      expect(fake_transaction_class).to have_received(:new).with('14-01-2012', 500, -500)
    end
    it 'should get recorded in the bank statement' do
      expect(account.bank_statement).to include(transaction)
    end
  end

  describe '#print_statement' do
    it 'should send a message to the the printer to print the bank statement' do
      account.deposit('10-01-2012', 1000)
      expected = [transaction]
      allow(printer).to receive(:print_format) { expected }
      expect(account.print_statement).to eq(expected)
    end
  end
end
