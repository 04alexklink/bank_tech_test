require '/bank_account'
describe BankAccount do 
  let(:bankaccount) { BankAccount.new }

  context 'initialisation of a new bank account' do
  it 'should be created with a starting balance of 0' do
    expect(bankaccount.balance).to eq(0)
  end
  it 'should have a transaction history of an array containing 1 nested array of ["date", "credit", "debit", "balance"]' do
    expect(bankaccount.transactions[0]).to eq(["date", "credit", "debit", "balance"])
  end
end
  context 'deposit into account' do
  it 'bank account owner should make a deposit of £50 and see balance increase to £50' do
    bankaccount.deposit(50)
    expect(bankaccount.balance).to eq(50)
  end
  it 'bank account owner should make a deposit of £50 and add relevant transaction info to transactions array' do
    bankaccount.deposit(50)
    expect(bankaccount.transactions[1]).to eq([Time.new.strftime('%d/%m/%Y'), "0", "50", "50"])
  end
end
  context 'withdrawal' do
  it 'bank account owner should make a withdrawal of £50 and see balance decrease to £50' do
    bankaccount.deposit(50)
    bankaccount.withdraw(50)
    expect(bankaccount.balance).to eq(0)
  end
  it 'bank account owner can only make a withdrawal if withdrawal amount < balance' do
    expect { bankaccount.withdraw(50) }.to raise_error("Your withdraw request is greater than your account balance. Please input a new withdrawal amount of 0 or less.")
    expect(bankaccount.balance).to eq 0
  end
  it 'bank account owner should make a deposit of £50, followed by a withdrawal of £50 and add relevant transaction info to transactions array' do
    bankaccount.deposit(50)
    bankaccount.withdraw(50)
    expect(bankaccount.transactions[2]).to eq([Time.new.strftime('%d/%m/%Y'), "50", "0", "0"])
  end
end
end