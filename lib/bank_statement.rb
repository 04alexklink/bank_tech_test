# frozen_string_literal: true

class BankStatement
  def print(transactions)
    transactions.each do |transaction|
      puts transaction
    end
  end
end
