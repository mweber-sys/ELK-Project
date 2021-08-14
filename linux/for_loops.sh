#!/bin/bash

#variable
states=('Tennessee' 'Texas' 'Maine' 'Hawaii' 'Virginia')

#for Loop
for state in ${states[@]}
do

  if [ $state == 'Hawaii' ];
  then
    echo "Hawaii is the best!"
  else
    echo "I'm not a fan of Hawaii."
  fi
done
