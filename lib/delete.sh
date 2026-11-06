#!/bin/bash

delete_expense() {
    local script_dir
    script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
    local file="$script_dir/data/expense.csv"
    local target_ID="$1"

    if [[ -z "$target_ID" ]]; then
        echo "Error: Please specify the ID of the expense you want to delete."
        echo "Example: ./expense.sh delete 28007"
        return 1
    fi

    if [[ ! "$target_ID" =~ ^[0-9]+$ ]]; then
        echo "Error: Invalid expense ID."
        return 1
    fi

    if [[ ! -f "$file" ]]; then
        echo "Error: Database file $file not found."
        return 1
    fi

    if ! awk -F, -v ID="$target_ID" '$1 == ID {found=1; exit} END {exit !found}' "$file"; then
        echo "Error: ID $target_ID does not exist."
        return 1
    fi

    local temp_file
    temp_file=$(mktemp "${file}.XXXXXX")

    awk -F, -v id="$target_ID" 'NR == 1 || $1 != id' "$file" > "$temp_file"

    chmod --reference="$file" "$temp_file"
    mv "$temp_file" "$file"

    echo "Success: Deleted expense ID $target_ID"
}
