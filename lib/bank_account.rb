class BankAccount
  attr_reader :balance, :transactions
  
  def initialize
    @balance = 0
    @transactions = [["   date   ||credit||debit||balance"]]
  end

  def deposit(amount)
    raise "Invalid entry. Try again." unless amount.to_i.positive?
    @balance += amount
    @transactions << ["#{Time.new.strftime("%d/%m/%Y")}||      || #{amount}|| #{@balance}"]
  end

  def withdraw(amount)
    raise "Invalid entry. Try again." unless amount.to_i.positive?
    raise "Your withdraw request is greater than your account balance. Please input a new withdrawal amount of #{balance} or less." if amount > @balance
    @balance -= amount
    @transactions << ["#{Time.new.strftime("%d/%m/%Y")}||  #{amount}||     || #{@balance}"]
  end
  
  def print_statement
    @transactions.each do |transaction|
      puts transaction
    end
  end
end