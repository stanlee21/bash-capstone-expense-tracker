#!/bin/bash


monthly_expenses() {
    local file="data/expense.csv"
    local current_month
    local total=0
    local -A category_totals=()
    local category

    current_month=$(date +%Y-%m)

    if [[ ! -f "$file" ]]; then
        echo "Error: Expense data file not found."
        return 1
    fi

    echo "Monthly Expense Report - $(date +%B\ %Y)"

    while IFS=, read -r id date amount category _; do
        [[ "$id" == "id" ]] && continue
        [[ -z "$id" ]] && continue

        if [[ "$date" == "$current_month"* ]]; then
            total=$((total + amount))

            category="${category:-Uncategorized}"

            category_totals["$category"]=$(( ${category_totals["$category"]:-0} + amount ))
        fi

    done < "$file"

        echo ""
    echo "Expenses by category:"

    if [[ ${#category_totals[@]} -eq 0 ]]; then
        echo "No expenses recorded for this month."
    else
        for category in "${!category_totals[@]}"; do
            printf "  %-15s %s XAF\n" "$category:" "${category_totals[$category]}"
        done
    fi

    echo "------------------------------"
    echo "Total: $total XAF"
}