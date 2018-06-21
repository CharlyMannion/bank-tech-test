# Bank Tech Test

## Overview
Practice tech test completed in Week 10 of Makers Academy

## User Stories

```
As a client
So I can manage my personal finances
I want a bank account

As a client
So I can add money to my bank account
I want to make a deposit to my account

As a client
So I can take money out of my bank account
I want to make a withdrawal to my account

As a client
So I can see a history of my transactions
I want to print my bank statement

As a client
So I can see the most recent transactions first
I want the statements to be listed in reverse chronological order

As a client
So I can see how much money I have in my account
I want my bank statement to include my bank balance
```

## Approach
* I followed a TDD, OOP approach
* I started by writing user stories for the given requirements (see below)
* I then diagrammed the Classes and the messages that would pass between them
* I then followed a process of red, green, refactor until I had satisfied the user stories
* I used a trello board to keep track of my progress
* I tried to be mindful that I might be required to extend the programme based on additional requirements, so I wrote code that should be easy to change (e.g. extract the bank statement in to its own class)

## Diagrams
* file:///Users/charlymannion/Downloads/bank-tech-test.html
<script type="text/javascript" src="https://www.draw.io/js/viewer.min.js"></script>
* file:///Users/charlymannion/Downloads/bank-tech-test-2.html

## Installation
* Clone the repo
* Run bundle install
* Run rspec to test

## Running the App
```
Charlys-MacBook-Air:bank-tech-test charlymannion$ irb

2.5.1 :001 > require './lib/bank_account'
 => true
2.5.1 :002 > bank_account = BankAccount.new
 => #<BankAccount:0x00007f829a9ee840 @balance=0, @bank_statement=[], @transaction_class=Transaction, @printer_class=Printer>
2.5.1 :003 > bank_account.deposit('10-01-2012', 1000.00)
 => [#<Transaction:0x00007f829a9e5ab0 @date="10-01-2012", @credit=1000.0, @debit="", @balance=1000.0>]
2.5.1 :004 > bank_account.deposit('13-01-2012', 1000.00)
 => [#<Transaction:0x00007f829a9e5ab0 @date="10-01-2012", @credit=1000.0, @debit="", @balance=1000.0>, #<Transaction:0x00007f829a9dcc80 @date="13-01-2012", @credit=1000.0, @debit="", @balance=2000.0>]
2.5.1 :005 > bank_account.withdraw('14-01-2012', 500.00)
 => [#<Transaction:0x00007f829a9e5ab0 @date="10-01-2012", @credit=1000.0, @debit="", @balance=1000.0>, #<Transaction:0x00007f829a9dcc80 @date="13-01-2012", @credit=1000.0, @debit="", @balance=2000.0>, #<T
ransaction:0x00007f829a9cf4b8 @date="14-01-2012", @credit="", @debit=500.0, @balance=1500.0>]
2.5.1 :006 > bank_account.print_statement
date || credit || debit || balance
14-01-2012 ||  || 500.0 || 1500.0
13-01-2012 || 1000.0 ||  || 2000.0
10-01-2012 || 1000.0 ||  || 1000.0
 => [#<Transaction:0x00007f829a9e5ab0 @date="10-01-2012", @credit=1000.0, @debit="", @balance=1000.0>, #<Transaction:0x00007f829a9dcc80 @date="13-01-2012", @credit=1000.0, @debit="", @balance=2000.0>, #<T
ransaction:0x00007f829a9cf4b8 @date="14-01-2012", @credit="", @debit=500.0, @balance=1500.0>]
```

## Test Coverage
```
Charlys-MacBook-Air:bank-tech-test charlymannion$ rspec -fd

BankAccount
  #initialize
    the default balance of nil
    it has an empty bank statement
  #deposit
    increases the bank balance by the specified amount
    creates a transaction with a credit value
    is recorded in the bank statement
  #withdraw
    reduces the bank balance by the specified amount
    creates a transaction with a debit value
    is recorded in the bank statement
  when the bank account bank balance is 0
    raise an error if the user tries to withdraw
  #print_statement
    sends a message to the the printer to print the bank statement

Printer
  #print_format
    prints the full bank statement
    prints the most recent transaction first

Transaction
  #initialize
    has a date
    has a value for debit
    has a value for credit
    has a balance

Finished in 0.08184 seconds (files took 1.18 seconds to load)
16 examples, 0 failures


COVERAGE: 100.00% -- 118/118 lines in 6 files
```

## Technologies
* ruby ~2.5.0
* rspec
* gem 'simplecov' - check the coverage of tests
* gem 'rubocop' - check the code syntax

## Trello
https://trello.com/b/Nbg8sPvP/bank-tech-test

## Contributing Members
Charly Mannion

## Specification (Provided)

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
