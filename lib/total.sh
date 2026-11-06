#!/bin/bash

#calculating total expenses
total_expenses() {
    local file="data/expense.csv"
    local total=0

    if [[ ! -f "$file" ]]; then
        echo "Error: Expense data file not found."
        return 1
    fi

    while IFS=, read -r id _ amount _ _; do
        [[ "$id" == "id" ]] && continue
        [[ -z "$id" ]] && continue

        total=$((total + amount))

    done < "$file"

    echo "Total expenses: $total XAF"
}