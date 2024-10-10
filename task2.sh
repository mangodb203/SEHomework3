#!/bin/bash

for file in dataset1/*; do
  if grep -q "sample" "$file"; then
    count=$(grep -o "CSC510" "$file" | wc -l)
    if [ $count -ge 3 ]; then
      echo "$count $file"
    fi
  fi
done |

sort -k1,1nr -k2,2nr |

awk '{print "filtered_" substr($2, 6)}' > task2_output.txt

ls -lS dataset1/* | grep "filtered_" | awk '{print $9}' > temp.txt
paste task2_output.txt temp.txt | sort -k2,2nr -k1,1nr | awk '{print $1}' > final_output.txt
mv final_output.txt task2_output.txt
