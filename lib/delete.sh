#!/bin/bash

delete_expense() {
    local file="data/expense.csv"
    target_ID="$1"

    #check if the user forgot to type the ID
    if [[ -z "$target_ID" ]]; then
        echo "Error: Please specify the ID of the expense you want to delete"
        echo "For Example: ./expense.sh delete 28007"
        return 1
    fi

    #check if the ID inputted exists
    if ! grep -q "$target_ID" "$file"; then
        echo "Error: ID $target_ID does not exist."
        return 1
    fi

    local temp_file
    temp_file=$(mktemp)

    #filter out the line we want to delete and saves the rest in a temp file
    awk -F'\t' -v id="$target_ID" '$1 != id {print $0}' "$file" > "$temp_file"

    # Overwrite the old database file with our updated file
    mv "$temp_file" "$file"

    echo "Success: Deleted expense ID $target_ID"
}