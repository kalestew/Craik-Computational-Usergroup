#!/bin/bash
# Count how many wells each enzyme has in a plate reader export.
#
# Usage:   bash practice/count_wells.sh practice/plate_reader.csv

file="$1"                     # $1 is the first word typed after the script name

if [ ! -f "$file" ]; then
  echo "Give me a CSV file, like this:"
  echo "    bash practice/count_wells.sh practice/plate_reader.csv"
  exit 1
fi

# cut: column 2.  tail -n +2: skip the header line.  sort -u: each name once.
for enzyme in $(cut -d, -f2 "$file" | tail -n +2 | sort -u); do
  count=$(grep -c ",$enzyme," "$file")
  echo "$enzyme: $count wells"
done
