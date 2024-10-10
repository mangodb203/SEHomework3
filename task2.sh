#!/bin/bash

cd dataset1 && \
grep -l "sample" file* | \
while read -r file; do
    occurrences=$(grep -o "CSC510" "$file" | wc -l)
    if [ $occurrences -ge 3 ]; then
        size=$(wc -c < "$file")
        echo "$file:$occurrences:$size"
    fi
done | \
sort -t: -k2,2nr -k3,3nr | \
sed 's/file_/filtered_/' | \
awk -F'[_:]' '{print $1 "_" $2}' | \
sort -t_ -k2 -nr
