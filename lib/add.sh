#!/bin/bash

add_expense() {
    local file="data/expense.csv"

    local AMOUNT="$1"
    local CATEGORY="$2"
    local NOTE="$3"
    local ID
    local CURRENT_DATE

    if [[ -z "$AMOUNT" ]] || [[ -z "$CATEGORY" ]]; then
        echo "Error: You must input the amount and the category."
        echo "Example: ./expense.sh add 500 Food 'Lunch'"
        return 1
    fi

    if [[ ! "$AMOUNT" =~ ^[1-9][0-9]*$ ]]; then
        echo "Error: Invalid amount. Please enter a positive whole number greater than 0 without leading zeroes."
        return 1
    fi

    if [[ -z "$NOTE" ]]; then
        NOTE="None"
    fi

    if [[ "$NOTE" == *","* || "$CATEGORY" == *","* ]]; then
        echo "Error: Category and Note must not contain commas."
        return 1
    fi

    mkdir -p "$(dirname "$file")"

    # Generate a unique ID
    while true; do
        ID=$RANDOM
        if [[ ! -f "$file" ]] || ! awk -F, -v id="$ID" '$1 == id {found=1; exit} END {exit !found}' "$file"; then
            break
        fi
    done

    CURRENT_DATE=$(date "+%Y-%m-%d %H:%M")

    echo "$ID,$CURRENT_DATE,$AMOUNT,$CATEGORY,$NOTE" >> "$file"
    echo "Success: Added \$$AMOUNT to $CATEGORY (ID: $ID)"
}
