# frozen_string_literal: true

require './lib/printer'

describe Printer do
  subject(:printer) { described_class.new }
  let(:bank_statement) { double(:bank_statement) }
  let(:transaction1) { double(:transaction) }
  let(:transaction2) { double(:transaction) }
  let(:transaction3) { double(:transaction) }

  it 'should respond to print' do
    expect(printer).to respond_to(:print)
  end

  describe '#print' do
    # it 'should print a bank statement' do
    #   expect(printer.print(bank_statement)).to eq(bank_statement)
    # end
    it 'should print each transaction in the bank_statements' do
      bank_statement_array = [transaction1, transaction2, transaction3]
      expect(printer.print(bank_statement_array)).to eq([transaction1, transaction2, transaction3])
    end
  end
end
