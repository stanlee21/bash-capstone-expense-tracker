#!/bin/bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib/total.sh"

command="${1:-}"

case "$command" in
    total)
        total_expenses
        ;;
    *)
        echo "Usage: ./expense.sh total"
        exit 1
        ;;
esac