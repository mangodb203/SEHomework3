#!/bin/bash	

# To check the number of fields
#gawk -F '{ print NF }' titanic.csv

# To check on specific line (Assuming 2)
#gawk -F 'NR == 2 {print NF}' titanic.csv

# STEP A
stepa=$(gawk -F, 'NR >= 2 && $3 == 2 && $13 ~ /S/ {print $0}' titanic.csv)

#echo "*********************************************************************"
#echo " Extracting Passenegers from 2nd Class who embarked at SouthHampton"
#echo "*********************************************************************"
#echo "$stepa"

# STEP B
stepb=$(echo "$stepa" | sed -e 's/,male,/,M,/' -e 's/,female,/,F,/')

#echo "****************************************************"
#echo "Repalcing Male/ Female Labels with M/F respectively"
#echo "****************************************************"
#echo "$stepb"

#STEP C
stepc=$(echo "$stepb" |  gawk -F, 'BEGIN {count = 0; sum_age = 0} {if ($7 != "") {count+=1; sum_age+=$7; print $0}} END {if (count > 0) print "Average age of the filtered Passengers is : " sum_age/count; else print "No valid data"}')
echo "Calculating the average of the filtered passengers :"
echo "*************************************************************************************"
echo "$stepc"
