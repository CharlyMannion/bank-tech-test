# frozen_string_literal: true

require './lib/printer'

describe Printer do
  subject(:printer) { described_class.new }
  let(:transaction1) { double(:transaction, date: "10/01/2012", amount: "1000.00", balance: "1000.00") }

  # expected = "      date || credit || debit || balance
  # 14/01/2012 || || 500.00 || 2500.00
  # 13/01/2012 || 2000.00 || || 3000.00
  # 10/01/2012 || 1000.00 || || 1000.00"

  it 'should respond to print' do
    expect(printer).to respond_to(:print_format)
  end

  describe '#print_format' do
    # it 'should print the date of each transaction in the bank_statement' do
    #   expected_heading = "date || credit || debit || balance\n"
    #   expected_date= "10/01/2012\n"
    #   bank_statement = [transaction1]
    #   expected_statement = expected_heading + expected_date
    #   expect { printer.print_format(bank_statement) }.to output(expected_statement).to_stdout
    # end
    it 'should print the full bank statement' do
      expected_heading = "date || credit || debit || balance\n"
      expected_transaction = "10/01/2012 || 1000.00 || 1000.00\n"
      bank_statement = [transaction1]
      expected_statement = expected_heading + expected_transaction
      expect { printer.print_format(bank_statement) }.to output(expected_statement).to_stdout
    end
  end
end
