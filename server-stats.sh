#!/bin/bash

TOTAL_CPU_USAGE=$(top -bn1 | awk '/Cpu\(s\)/ {printf "%.2f", $2 + $4}')

TOTAL_MEM_USED=$(free | awk '/Mem/ && !/Swap/ {printf "%.2f", ($3/$2)*100}')
FREE_MEM=$(free | awk '/^Mem/ {printf "%.2f", ($4/$2)*100}')

TOTAL_SPACE_USAGE=$(df -h / | awk '/dev/ {print $5}')
AVAILABLE_SPACE_PERCENTAGE=$(df -h / | awk '/dev/ {print 100 - $5}')

cat << EOF

                        SERVER STATS
_______________________________________________________________

Total CPU Usage: ${TOTAL_CPU_USAGE}%

Total Memory Usage:

    Used Memory: ${TOTAL_MEM_USED}%
    Free Memory: ${FREE_MEM}%

Total Disk Usage: 

    Disk Usage: ${TOTAL_SPACE_USAGE}
    Available Space: ${AVAILABLE_SPACE_PERCENTAGE}%

Top 5 processes by CPU Usage: 

$(ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n 6)

Top 5 processes by Memory Usage: 

$(ps -eo pid,user,%mem,comm --sort=-%mem | head -n 6)
_______________________________________________________________
EOF



