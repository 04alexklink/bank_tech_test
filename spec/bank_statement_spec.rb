# frozen_string_literal: true

require 'bank_statement'
describe BankStatement do
  it 'prints a bankstatement' do
    bankstatement = BankStatement.new
    expect(bankstatement).to respond_to(:print).with(1).argument
  end
  it 'prints out a each element of an array when provided with an array as an argument' do
    bankstatement = BankStatement.new
    array = ['hello, goodmorning, goodday, goodnight']
    expect(bankstatement.print(array)).to eq(['hello, goodmorning, goodday, goodnight'])
  end
end
