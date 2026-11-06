#!/bin/bash

show_help() {
    cat <<EOF
Expense Tracker - Help

Usage:
  ./expense.sh [command]

Available commands:
  add       Add a new expense
  list      Display all expenses
  delete    Delete an expense
  total     Display total expenses
  month     Display the current month's expense report
  help      Display this help message

Examples:
  ./expense.sh add
  ./expense.sh list
  ./expense.sh total
  ./expense.sh month
  ./expense.sh help
EOF
}