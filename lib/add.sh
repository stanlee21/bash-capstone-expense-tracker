#!/bin/bash

add_expense() {
    local file="data/expense.csv"

    AMOUNT="$1"
    CATEGORY="$2"
    NOTE="$3"

    if [[ -z "$AMOUNT" ]] || [[ -z "$CATEGORY" ]]; then
        echo "Please you must input the amount and the category"
        echo "For example ./expense.sh add 500 Food 'Lunch'"
    fi

    if [[ -z "$NOTE" ]]; then
        NOTE="None"
    fi
}