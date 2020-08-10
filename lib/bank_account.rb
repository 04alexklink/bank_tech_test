class BankAccount
  attr_reader :balance
  
  def initialize
    @balance = 0
  end


  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    return if amount > @balance
    @balance -= amount
  end
end