require 'bank_statement'
describe BankStatement do 
  it 'prints a bankstatement' do
    bankstatement = BankStatement.new
    expect(bankstatement).to respond_to(:print).with(1).argument
  end

end