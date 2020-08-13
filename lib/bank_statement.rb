# frozen_string_literal: true

class BankStatement

  def print(transactions = [])
    transactions.each do |transaction|
      puts transaction
    end
    return header
  end

  private 
  
  def header
    return "date || credit || debit || balance"
  end
end
