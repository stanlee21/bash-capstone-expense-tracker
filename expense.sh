#!/bin/bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib/total.sh"
source "$SCRIPT_DIR/lib/month.sh"

command="${1:-}"

case "$command" in
    total)
        total_expenses
        ;;
    month)
        monthly_expenses
        ;;
    *)
        echo "Usage: ./expense.sh {total|month}"
        exit 1
        ;;
esac