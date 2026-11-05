# Personal Expense Tracker

A lightweight command-line application built with Bash for recording, managing, and analysing personal expenses directly from the terminal.

## Overview

The Personal Expense Tracker helps users keep track of their daily spending, understand where their money goes, and monitor expenses by category over time.

Instead of relying on spreadsheets or external applications, users can manage their expenses through simple terminal commands.

The project is designed to demonstrate practical Bash scripting skills, including command-line argument handling, file management, input validation, text processing, and data analysis.

## Features

- **Add Expenses:** Record expenses with an amount, category, and optional note.
- **List Expenses:** Display recorded expenses in aligned columns.
- **Delete Expenses:** Remove an expense using its unique ID.
- **All-Time Total:** Calculate the total amount spent across all recorded expenses.
- **Monthly Summary:** View spending totals grouped by category for the current month.
- **Help:** Display available commands and usage instructions.
- **Persistent Storage:** Save expense records locally using a CSV file.

## Project Structure

```text
expense-tracker/
├── expense.sh
├── expenses.csv
├── README.md
└── .gitignore
```

## Requirements

- Linux operating system
- Bash
- Standard Unix utilities such as `awk`, `date`, and `sort`

## Usage

The application is designed around the following command structure:

```bash
./expense.sh COMMAND [ARGUMENTS]
```

### Available Commands

| Command | Description |
|---|---|
| `add AMOUNT CATEGORY [NOTE]` | Add a new expense |
| `list` | Display all recorded expenses |
| `delete ID` | Delete an expense by its ID |
| `total` | Display total spending |
| `month` | Display monthly spending by category |
| `help` | Display usage instructions |

### Examples

**Add an expense**

```bash
./expense.sh add 2500 Food Lunch
```

**List all expenses**

```bash
./expense.sh list
```

**Delete an expense**

```bash
./expense.sh delete 1
```

**View total spending**

```bash
./expense.sh total
```

**View monthly spending**

```bash
./expense.sh month
```

**Display help**

```bash
./expense.sh help
```

## Data Storage

Expense records are stored locally in a CSV file named `expenses.csv`.

Each record contains:

- Unique expense ID
- Date of transaction
- Expense amount
- Expense category
- Optional note

## Learning Objectives

This project builds on practical Bash scripting concepts, including:

- Shell functions and subcommands
- Command-line argument handling
- Conditional statements and loops
- Input validation and error handling
- File reading and writing
- Text processing with `awk`
- Data aggregation and calculations
- Date handling and monthly filtering

## Project Status

In development.

This is a personal learning project focused on strengthening Bash scripting skills through the development of a practical command-line application.
