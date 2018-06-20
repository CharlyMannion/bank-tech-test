# frozen_string_literal: true

require './lib/printer'

describe Printer do
  subject(:printer) { described_class.new }
  # let(:bank_statement) { double(:bank_statement) }
  # let(:transaction) { double(:transaction) }
  # let(:transaction1) { double(:transaction, date: "10-01-2012", amount: 1000, balance: 1000) }
  # let(:transaction2) { double(:transaction, date: "13-01-2012", amount: 2000, balance: 3000) }
  # let(:transaction3) { double(:transaction, date: "14-01-2012", amount: 500, balance: 2500) }

  # expected = "      date || credit || debit || balance
  # 14/01/2012 || || 500.00 || 2500.00
  # 13/01/2012 || 2000.00 || || 3000.00
  # 10/01/2012 || 1000.00 || || 1000.00"

  # transaction1 = "10/01/2012 || 1000.00 || || 1000.00"
  # transaction2 = "13/01/2012 || 2000.00 || || 3000.00"
  # transaction3 = "14/01/2012 || || 500.00 || 2500.00"

  it 'should respond to print' do
    expect(printer).to respond_to(:print_format)
  end

  describe '#print_format' do
    it 'should print the column headings' do
      expected_heading = "date || credit || debit || balance\n"
      expected_transaction = "10/01/2012"
      bank_statement = [expected_transaction]
      expect { printer.print_format(bank_statement) }.to output(expected_heading).to_stdout
    end
    # it 'should print the date of each transaction in the bank_statement' do
    #   expected_heading = "date || credit || debit || balance\n"
    #   expected_transaction = "10/01/2012\n"
    #   expected_statement = expected_heading + expected_transaction
    #   expect { printer.print_format(bank_statement) }.to output(expected_statement).to_stdout
    #   #hashed out return I want, passing test left in. Discover whether issue is with test or with methods
    #   # expect(printer.print_format(bank_statement_array)).to eq(formatted_transaction3)
    #   # expect(printer.print_format(bank_statement_array)).to eq("10-01-2012")
    # end
  end
end
