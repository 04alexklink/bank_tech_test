# frozen_string_literal: true

class BankStatement

  def print_statement(transactions = [])
    whole_statement = []
    transactions.each do |statement_line|
      whole_statement << "#{statement_line[:date]} || #{correct_format(statement_line[:credit])} || #{correct_format(statement_line[:debit])} || #{correct_format(statement_line[:balance])}"
    end
    whole_statement.push(header)
    return whole_statement.reverse!
  end

  private 

  def header
    "date || credit || debit || balance"
  end

  def correct_format(creditordebit)
    if creditordebit >0
      two_decimal_places(creditordebit)
    end
  end

  def two_decimal_places(number)
      '%.2f' % number
  end
end
