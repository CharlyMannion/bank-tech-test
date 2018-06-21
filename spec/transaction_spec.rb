# frozen_string_literal: true

require './lib/transaction'

describe Transaction do
  subject(:transaction) { described_class.new('10-01-2012', 1000, 1000) }

  describe '#initialize' do
    it 'should have a date' do
      expect(transaction.date).to eq('10-01-2012')
    end
    it 'should have a value for debit' do
      expect(transaction.debit).to eq(1000)
    end
    it 'should have a balance' do
      expect(transaction.balance).to eq(1000)
    end
  end
end
