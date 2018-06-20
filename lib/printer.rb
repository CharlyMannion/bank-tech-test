# frozen_string_literal: true

class Printer
  def print_format(bank_statement)
    bank_statement.each { |transaction| puts transaction}
  end
end
