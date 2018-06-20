# frozen_string_literal: true

require './lib/printer'

describe Printer do
  subject(:printer) { described_class.new }
  let(:bank_statement) { double(:bank_statement) }

  it 'should respond to print' do
    expect(printer).to respond_to(:print)
  end

  describe '#print' do
    it 'should print a bank statement' do
      expect(printer.print(bank_statement)).to eq(bank_statement)
    end
  end
end
