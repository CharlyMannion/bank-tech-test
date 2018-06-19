# frozen_string_literal: true

require './lib/transaction'

describe Transaction do
  subject(:transaction) { described_class.new('10-01-2012', 1000) }

  describe '#initialize' do
    it 'should have a date' do
      expect(transaction.date).to eq('10-01-2012')
    end
    it 'should have an amount' do
      expect(transaction.amount).to eq(1000)
    end
  end
end
