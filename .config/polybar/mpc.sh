#!/bin/bash

MPC=$(mpc status | awk '$0 = length; NR==1 { exit }')
STOP=$(mpc status | awk '{if (NR==2) print $1}')

if [[ "$STOP"  == "[paused]" || "$MPC" == 68 ]]
then
   echo 'Paused'
elif [ "$MPC" -lt 40 ]
then
   printf '%s' "$(mpc status | awk '{if (NR==1) print}')"
else
   printf '%.40s...' "$(mpc status | awk '{if (NR==1) print}')"
fi

