#!/bin/bash

extract (){

# extracting data from oars site and storing it in a cleaner form

info=$(curl -s http://oa.cc.iitk.ac.in/Oa/Jsp/OAServices/IITk_SrchRes.jsp?sbm=Y -d typ="stud" -d numtxt=$2)

mkdir data/$1/$2

wget -q http://oa.cc.iitk.ac.in/Oa/Jsp/Photo/$2_0.jpg -O data/$1/$2/$2.jpg

echo "$info" | grep -P -A 42 "Roll No" | sed "s/\t*//g" | sed 's/<[^>]*>//g' | sed "s/ +/ /g" | sed -e 's/$//' | sed '/^$/d' | sed -e 's/^[ \t]*//' | sed 's/>//g' | sed 's/--//g' > data/$1/$2/temp.ttxt 

cat data/$1/$2/temp.ttxt | grep -P -A1 'Roll No:'\|'Name:' | xargs -L 1 > data/$1/$2/$2.txt

cat data/$1/$2/temp.ttxt | grep -P -A1 "Gender:" | xargs -L 2 >> data/$1/$2/$2.txt

cat data/$1/$2/temp.ttxt | grep -P -A1 'Program:' | xargs -L 2 >> data/$1/$2/$2.txt 

cat data/$1/$2/temp.ttxt | grep -P -A1 'Department:'\|'Hostel Info:' | xargs -L 1 >> data/$1/$2/$2.txt

cat data/$1/$2/temp.ttxt | grep -P "E-Mail:" >> data/$1/$2/$2.txt

cat data/$1/$2/temp.ttxt | grep -P -A1 "Blood Group:" | xargs -L 2 >> data/$1/$2/$2.txt

cat data/$1/$2/temp.ttxt | grep -P -A1 "CountryOfOrigin:" | xargs -L 2  >> data/$1/$2/$2.txt

cat data/$1/$2/temp.ttxt | grep -P "Permanent" >> data/$1/$2/$2.txt 

cat data/$1/$2/temp.ttxt | tail -1 | sed 's/M/ \nM/' >> data/$1/$2/$2.txt 

# remove data with no names ( as no such data exists )
    
    cat data/$1/$2/$2.txt | grep -q -P 'Name: Program'
    if [ $? = 0 ] ; then
         rm -rf data/$1/$2
    fi 


 
export -f extract


rm -rf data

mkdir data

#y17

rm -rf data/y17'

mkdir data/y17

echo 'Downloading data of y17 students.....'

seq 170001 170850 | xargs -n 1 -P 50 -I{} bash -c 'extract y17 {}'

echo 'Data of y13 students has been successfully downloaded.'

#y16

rm -rf data/y16

mkdir data/y16

echo 'Downloading data of y16 students.....'

seq 160001 160850 | xargs -n 1 -P 50 -I{} bash -c 'extract y16 {}'  

echo 'Data of y16 students has been successfully downloaded.'

#y15

rm -rf data/y15

mkdir data/y15

echo 'Downloading data of y15 students.....'

seq 150001 150845 | xargs -n 1 -P 50 -I{} bash -c 'extract y15 {}'

echo 'Data of y15 students has been successfully downloaded.'

#y14

rm -rf data/y14

mkdir data/y14

echo 'Downloading data of y14 students.....'

seq 14001 14832 | xargs -n 1 -P 50 -I{} bash -c 'extract y14 {}'

echo 'Data of y14 students has been successfully downloaded.'

