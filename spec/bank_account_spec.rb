require '/bank_account'
describe BankAccount do 
  it 'should be created with a starting balance of 0' do
    bankaccount = BankAccount.new
    expect(bankaccount.balance).to eq(0)
  end
  it 'bank account owner should make a deposit of £50 and see balance increase to £50' do
    bankaccount = BankAccount.new
    bankaccount.deposit(50)
    expect(bankaccount.balance).to eq(50)
  end
  context 'withdrawal' do
  it 'bank account owner should make a withdrawal of £50 and see balance decrease to £50' do
    bankaccount = BankAccount.new
    bankaccount.deposit(50)
    bankaccount.withdraw(50)
    expect(bankaccount.balance).to eq(0)
  end
  it 'bank account owner can only make a withdrawal if withdrawal amount < balance' do
    bankaccount = BankAccount.new
    bankaccount.withdraw(50)
    expect(bankaccount.balance).to eq 0
  end
end
end