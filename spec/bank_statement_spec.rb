# frozen_string_literal: true

require 'bank_statement'
describe BankStatement do
  describe 'Print Statement Method:' do

    it 'prints only the statement header if not passed any transactions' do
      bankstatement = BankStatement.new
      expect(bankstatement.print_statement).to eq(["date || credit || debit || balance"])
    end
    it 'prints statement lines when provided with an array of hashes' do
      bankstatement = BankStatement.new
      input = [{:date => '15/01/2018', :credit => 5, :debit => 0, :balance => 5}]
      expect(bankstatement.print_statement(input)).to eq(['date || credit || debit || balance', '15/01/2018 || 5.00 ||  || 5.00'])
    end
    it 'prints statement lines correctly' do
      bankstatement = BankStatement.new
      input = [{:date => '16/01/2018', :credit => 0, :debit => 2, :balance => 5},{:date => '15/01/2018', :credit => 5, :debit => 0, :balance => 5}]
      expect(bankstatement.print_statement(input)).to eq(['date || credit || debit || balance', '15/01/2018 || 5.00 ||  || 5.00'])
    end
  end
end
