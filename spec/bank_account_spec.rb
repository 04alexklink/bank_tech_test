require '/bank_account'
describe BankAccount do 
  it 'should be created with a starting balance of 0' do
    bankaccount = BankAccount.new
    expect(bankaccount.balance).to eq(0)
  end
end