#!/bin/bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib/add.sh"
source "$SCRIPT_DIR/lib/total.sh"
source "$SCRIPT_DIR/lib/month.sh"
source "$SCRIPT_DIR/lib/help.sh"

command="${1:-}"

case "$command" in
    add)
        add_expense "$2" "$3" "$4"
        ;;
    total)
        total_expenses
        ;;
    month)
        monthly_expenses
        ;;
    help)
        show_help
        ;;
    *)
        echo "Usage: ./expense.sh {add|list|delete|total|month|help}"
        exit 1
        ;;
esac