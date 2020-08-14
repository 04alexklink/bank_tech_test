# frozen_string_literal: true

require_relative 'bank_statement'

class BankAccount
  attr_reader :balance, :transactions

  def initialize(statement = BankStatement.new)
    @balance = 0
    @transactions = []
    @statement = statement
  end

  def deposit(credit, date = Time.new.strftime('%d/%m/%Y'))
    positive_number_check(credit)
    @balance += credit
    store_transaction(date, credit, 0, balance)
  end

  def withdraw(debit, date = Time.new.strftime('%d/%m/%Y'))
    positive_number_check(debit)
    insufficient_funds_check(@balance, debit)
    @balance -= debit
    store_transaction(date, 0, debit, balance)
  end

  def print_statement
    @statement.print(@transactions)
  end

  private

  def insufficient_funds_check(balance, amount)
    if amount > balance
      raise "Insufficient funds. Please input a new withdrawal amount of #{balance} or less."
    end
  end

  def positive_number_check(amount)
    raise 'Invalid entry. Try again.' unless amount.to_i.positive?
  end
  
  def store_transaction(date, credit, debit, balance)
    @transactions << {:date => date, :credit => credit, :debit => debit, :balance => balance} 
  end
end
