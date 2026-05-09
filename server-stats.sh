#!/bin/bash

TOTAL_CPU_USAGE=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8}')

TOTAL_MEM_USED=$(free | awk '/Mem/ && !/Swap/ {printf "%.2f", ($3/$2)*100}')

FREE_MEM=$(free | awk '/Mem/ && !/Swap/ {printf "%.2f", ($4/$2)*100}')

cat << EOF
______________

Total CPU Usage: ${TOTAL_CPU_USAGE}%

Total Memory Usage:

    Used Memory: ${TOTAL_MEM_USED}%
    Free Memory: ${FREE_MEM}%
_______________
EOF



