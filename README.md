# bank_tech_test

As a bank customer,
So that I can use my account,
I'd like my bank account to show my balance.

As a bank customer,
So that I can use my account,
I'd like to be able to make a deposit

As a bank customer,
So that I can use my account,
I'd like to make a withdrawal

As a bank customer,
So that I can use my account,
I'd like to print my account statement

-- Can only make a withdrawal if my account balance is greater than requested withdrawal amount
-- Get an error message telling me my requested withdrawal amount is greater than my balance, and tells me what amount i can withdraw
-- Get an error message if argument input for withdraw or deposit is not a positive number


Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

Step 1: Create spec file, rspec --init to create spec_helper.rb and .rspec, bundle init to create Gemfile. 
Step 2: require simplecov and rubocop for test coverage and code quality
Note: Related to simplecov, can type in terminal 'open coverage' which will open up the html file on the web displaying your coverage!
Step 3: In the root, do touch .rubocop.yml which will create a file. 