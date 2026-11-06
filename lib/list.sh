#!/bin/bash

list_expenses() {
    local script_dir
    script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
    local file="$script_dir/data/expense.csv"

    if [[ ! -f "$file" ]] || [[ $(wc -l < "$file") -le 1 ]]; then
        echo "Your expense tracker is empty."
        return 0
    fi

    echo "ID,DATE,AMOUNT,CATEGORY,NOTE" | column -s, -t

    tail -n +2 "$file" | column -s, -t
}