#!/bin/bash

# The command that produces the output (replace this with your actual command)
command_output=$(cat << EOF
1 1
2 2
3 3
4 4
5 5
6 6
e 9
q 7
r 10
w 8
EOF
)

# The desired order
order="123456QWER"

# Sort the command output based on the order
sorted_output=$(echo "$command_output" | awk -v order="$order" '
    BEGIN {
        split(order, order_arr, "")
        for (i=1; i<=length(order); i++) order_index[tolower(order_arr[i])] = i
    }
    {
        key = tolower(substr($1, 1, 1))
        if (key in order_index) {
            lines[order_index[key]] = $0
        }
    }
    END {
        for (i=1; i<=length(order); i++)
            if (i in lines) print lines[i]
    }
')

echo "Original output:"
echo "$command_output"
echo
echo "Sorted output:"
echo "$sorted_output"

