# Load_Analysis
If a linux server running java application servers has high load then find java application processes that have high CPU usage, and find the high CPU usage threads of these processes. Script keeps a log and also keeps a record with thread dumps and the names of the threads and finally does a pattern match at the application server logs for these threads and keeps their activity at the time of the script execution in a separate file
Run from crontab something like this:

Just edit enviromental_variables to put the desired variables and thats it..
After add to crontab something like this:

##load analysis script
*/2 * * * *  /root/scripts/load/load_analysis.sh >> /netapp/load_analysis/$(hostname -s).log 2>&1
##
