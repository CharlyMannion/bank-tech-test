# frozen_string_literal: true

require './lib/printer'

describe Printer do
  subject(:printer) { described_class.new }

  it 'should respond to print' do
    expect(printer).to respond_to(:print)
  end
end
