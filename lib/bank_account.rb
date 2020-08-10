class BankAccount
  attr_reader :balance
  
  def initialize
    @balance = 0
  end


  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise "Your withdraw request is greater than your account balance. Please input a new withdrawal amount of #{balance} or less." if amount > @balance
    @balance -= amount
  end
end