# frozen_string_literal: true

class Transaction
  attr_reader :date

  def initialize(date)
    @date = date
  end
end
