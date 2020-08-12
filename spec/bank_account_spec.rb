require '/bank_account'

describe BankAccount do
  let(:bankaccount) { BankAccount.new(statement) }
  let(:statement) { double('statement') }

  context 'initialisation of a new bank account' do
    it 'should be created with a starting balance of 0' do
      expect(bankaccount.balance).to eq(0)
    end

    it 'should have a transaction history of an array containing 1 nested array of ["date", "credit", "debit", "balance"]' do
      expect(bankaccount.transactions[0]).to eq(['   date   ||credit||debit||balance'])
    end
  end
  context 'deposit into account' do
    it 'bank account owner should make a deposit of £50 and see balance increase to £50' do
      bankaccount.deposit(50)
      expect(bankaccount.balance).to eq(50)
    end
    it 'bank account owner should make a deposit of £50 and add relevant transaction info to transactions array' do
      bankaccount.deposit(50)
      expect(bankaccount.transactions[1]).to eq(["#{Time.new.strftime('%d/%m/%Y')}||      || 50|| 50"])
    end
    it 'should only accept positive numerical values' do
      expect { bankaccount.withdraw('notanumber') }.to raise_error('Invalid entry. Try again.')
      expect { bankaccount.deposit(-20) }.to raise_error('Invalid entry. Try again.')
    end
  end
  context 'withdrawal' do
    it 'bank account owner should make a withdrawal of £50 and see balance decrease to £50' do
      bankaccount.deposit(50)
      bankaccount.withdraw(50)
      expect(bankaccount.balance).to eq(0)
    end
    it 'bank account owner can only make a withdrawal if withdrawal amount < balance' do
      expect { bankaccount.withdraw(50) }.to raise_error('Insufficient funds. Please input a new withdrawal amount of 0 or less.')
      expect(bankaccount.balance).to eq 0
    end
    it 'bank account owner should make a deposit of £50, followed by a withdrawal of £50 and add relevant transaction info to transactions array' do
      bankaccount.deposit(50)
      bankaccount.withdraw(50)
      expect(bankaccount.transactions[2]).to eq(["#{Time.new.strftime('%d/%m/%Y')}||  50||     || 0"])
    end
    it 'should only accept positive numerical values' do
      expect { bankaccount.withdraw('notanumber') }.to raise_error('Invalid entry. Try again.')
      expect { bankaccount.withdraw(-20) }.to raise_error('Invalid entry. Try again.')
    end
  end
  context 'printstatement' do
    before do
      allow(statement).to receive(:print)
    end
    it 'calls the print method on statements' do
      bankaccount.print_statement
      expect(statement).to have_received(:print)
    end
    it 'bank user should see their transaction history when choosing to print their transactions' do
      bankaccount.deposit(2000)
      bankaccount.deposit(1000)
      bankaccount.withdraw(500)
      expect(bankaccount.print_statement).to eq([['   date   ||credit||debit||balance'], ["#{Time.new.strftime('%d/%m/%Y')}||      || 2000|| 2000"], ["#{Time.new.strftime('%d/%m/%Y')}||      || 1000|| 3000"], ["#{Time.new.strftime('%d/%m/%Y')}||  500||     || 2500"]])
    end
    # cant comment the above test out... no clue why
  end
  
end
