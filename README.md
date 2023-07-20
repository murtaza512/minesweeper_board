# Minesweeper Board Generator

## Description

Minesweeper Board Generator is a Rails 7 application that allows users to create Minesweeper boards based on their preferred size and number of mines. It also displays the last 10 boards created by users.

## Installation

1. Make sure you have Ruby (version 3.0.0) and Rails 7 installed on your system.
2. Clone this repository to your local machine.
3. Install the required gems by running:
  `bundle install`
4. Set up the database by running:
  `rails db:create`
  `rails db:migrate`
5. Start the Rails server:
  `rails server`
6. Visit `http://localhost:3000` in your web browser to access the application.

## Usage

1. On the homepage, enter the number of rows, columns, and mines you want for the Minesweeper board.
2. Provide your email address (optional) to associate the board with your account.
3. Click the "Generate Board" button to create the Minesweeper board based on your inputs.

## System Tests

The application includes system tests using Capybara to ensure the correctness of various user interactions.

## Credits
Ghulam Murtaza
