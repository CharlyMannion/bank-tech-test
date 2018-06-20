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
file:///Users/charlymannion/Downloads/bank-tech-test.html
file:///Users/charlymannion/Downloads/bank-tech-test-2.html

## Installation
* Clone the repo 
* Run bundle install
* Run rspec to test

## Running the App


## Test Coverage Screenshot


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
