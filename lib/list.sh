#!/bin/bash

list_expenses() {
    local file="data/expense.csv"

    if [[ ! -f "$file" || ! -s "$file" ]]; then
        echo "Your expense tracker is empty."
        return 0
    fi

    # Use column command to create a perfectly aligned table layout
    (
        echo "ID,DATE,TIME,AMOUNT,CATEGORY,NOTE"
        cat "$file"
    ) | column -s, -t
}
