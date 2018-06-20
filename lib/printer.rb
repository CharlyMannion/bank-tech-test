# frozen_string_literal: true

class Printer

  # print_header = "date || credit || debit || balance"

  def print_format(bank_statement)
    print_heading
    # print_body(bank_statement)
  end

  private
  def print_heading
    puts "date || credit || debit || balance"
  end

  # def print_body(bank_statement)
  #   bank_statement.each { |transaction| puts "#{transaction.date}"}
  # end
end
