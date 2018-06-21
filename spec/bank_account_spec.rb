# frozen_string_literal: true

require './lib/bank_account'

describe BankAccount do
  subject(:account) { described_class.new(transaction_class: fake_transaction_class, printer_class: fake_printer_class) }
  let(:fake_transaction_class) { double(:fake_transaction_class, new: transaction) }
  let(:transaction) { double(:transaction, date: "10/01/2012", credit: "", debit: "1000.00", balance: "1000.00") }
  let(:fake_printer_class) { double(:fake_printer_class, new: printer) }
  let(:printer) { double(:printer, print_format: transaction) }

  describe '#initialize' do
    it 'the default balance of nil' do
      expect(account.balance).to eq BankAccount::DEFAULT_BALANCE
    end
    it 'it has an empty bank statement' do
      expect(account.bank_statement).to eq([])
    end
  end

  describe '#deposit' do
    before do
      account.deposit('10-01-2012', 1000)
    end
    it 'increases the bank balance by the specified amount' do
      expect(account.balance).to eq 1000
    end
    it 'creates a transaction with a credit value' do
      expect(fake_transaction_class).to have_received(:new)
      .with('10-01-2012', 1000, 0, 1000)
    end
    it 'is recorded in the bank statement' do
      expect(account.bank_statement).to include(transaction)
    end
  end

  describe '#withdraw' do
    before do
      account.deposit('13-01-2012', 3000)
      account.withdraw('14-01-2012', 500)
    end
    it 'reduces the bank balance by the specified amount' do
      expect(account.balance).to eq 2500
    end
    it 'creates a transaction with a debit value' do
      expect(fake_transaction_class).to have_received(:new)
      .with('14-01-2012', 0, 500, 2500)
    end
    it 'is recorded in the bank statement' do
      expect(account.bank_statement).to include(transaction)
    end
  end

  describe 'when the bank account bank balance is 0' do
    it 'raise an error if the user tries to withdraw' do
      allow(account).to receive(:balance) { 0 }
      expect { account.withdraw("15-01-2012", 5000000)}.to raise_error "Insufficient funds"
    end
  end

  describe '#print_statement' do
    it 'sends a message to the the printer to print the bank statement' do
      account.deposit('10-01-2012', 1000)
      account.print_statement
      expect(fake_printer_class).to have_received(:new)
    end
  end
end
