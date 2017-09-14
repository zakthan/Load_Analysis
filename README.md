# Load_Analysis
If a linux server running java application servers has high load then find java application processes that have high CPU usage, and find the high CPU usage threads of these processes. Script keeps a log and also keeps a record with thread dumps and the names of the threads and finally does a pattern match at the application server logs for these threads and keeps their activity at the time of the script execution in a separate file

Same as master branch but also added a seperate threshod for email alert that is if normalized cpu usage is above 1
