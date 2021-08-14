#!/bin/bash


#Create variable to  hold path of output file
output=$HOME/research/sys_info.txt

#create Research Dir with If 
if  [ ! -d $HOME/research ]
then
        mkdir $HOME/research
fi

#Create Sys_info File
if [ -f $output ]
then
        rm $output
fi

#Body
echo "A Quick System Audit Script">> $output
date >> $output
echo " " >> $output
echo -e "$MACHTYPE \n" >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP Info: $(ip addr | head -9 | tail -1) \n" >> $output
echo "Hostname: $(hostname -s)" >> $output

#Create research directory
#mkdir ~/research2> /dev/null

#Find 777 files
echo -e "\n777 Files:" >> $output
find / -type f -perm 777 >> $output

#Find Top Processes
echo -e "\nTop 10 Processes" >> $output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $output
