#!/bin/bash
grep -rl "sample" ./dataset1 | xargs grep -o "CSC510" | cut -d: -f1| xargs ls -l | uniq -c | grep -E "[3-9] -|[0-9]{2,} -" | gawk '{print $1 ,$6, $10}'| sort -k1,1nr -k2,2nr| sed 's/file/filtered/'| gawk '{print $3}' > output.txt

echo "Output has been saved to output.txt"
