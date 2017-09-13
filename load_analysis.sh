#!/bin/bash

SCIPT_HOME=/root/scripts/load
source $SCIPT_HOME/enviromental_variables
source $SCIPT_HOME/high_cpu_processes
source $SCIPT_HOME/dumps_and_threads

if [ "${LOAD_AVERAGE_CURRENT%.*}" -ge "${LOAD_AVERAGE_THRESHOLD%.*}" ]
then 
	echo "---------------------------------------------------"
        echo "$DATE Load average is ${LOAD_AVERAGE_CURRENT%.*}" 
	high_cpu_processes
	if [ $? -ne 0 ]
   	then 
		echo "---------------------------------------------------"
		exit 1
	else
        	while read -r TOMCAT_PID
        	do 
          	dumps_and_threads $TOMCAT_PID
        	done < /tmp/high_cpu_processes_tomcat_pids.txt
		echo "---------------------------------------------------"
	
	fi
	echo "$DATE Load average is ${LOAD_AVERAGE_CURRENT%.*}" |mailx -s "$HOST $DATE Check Load average . Sent from load_analysis tool" $MAILLIST
else 
	echo "---------------------------------------------------"
	echo "$DATE Load average is below $LOAD_AVERAGE_THRESHOLD"
	echo "---------------------------------------------------"

fi 
