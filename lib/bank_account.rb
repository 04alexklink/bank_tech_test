class BankAccount
  attr_reader :balance, :transactions
  
  def initialize
    @balance = 0
    @transactions = [["date", "credit", "debit", "balance"]]
  end

  def deposit(amount)
    @balance += amount
    @transactions << [Time.new.strftime("%d/%m/%Y").to_s, "0", amount.to_s, @balance.to_s]
  end

  def withdraw(amount)
    raise "Your withdraw request is greater than your account balance. Please input a new withdrawal amount of #{balance} or less." if amount > @balance
    @balance -= amount
    @transactions << [Time.new.strftime("%d/%m/%Y").to_s, amount.to_s, "0", @balance.to_s]
  end
end