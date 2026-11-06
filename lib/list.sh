#!/bin/bash

list_expenses() {
    local file="data/expense.csv"

    #checking if the file is empty or not
    if [[ ! -s "$file" ]]; then
        echo "Your expense tracker is empty"
        return 0
    fi

    # Print a header layout 
    echo -e "ID\tDATE\tTIME\tAMOUNT\tCATEGORY\tNOTE"
    echo "--------------------------------------------------------"

    tr ',' '\t' < $file

}