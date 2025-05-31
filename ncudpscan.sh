#!/bin/bash

echo "Network address (e.g. 192.168.0): "
read net
echo "Starting host range (e.g. 1): "
read start
echo "Ending host range (e.g. 254): "
read end
echo "Ports, either a range with dash or individually with space (e.g. 21-23 80): "
read ports

for ((i=$start; $i<=$end; i++))

do
	nc -nuvz $net.$i $ports 2>&1 | grep -E 'succ|open'
done

#This will open a netcat scan on the indicated IP address/range and directed ports
#-n not resolving hostnames
#-u specifies UDP scan
#-v running verbosely
#-z without sending any data (used for scanning)
#2>&1 redirects STDERR to STDOUT, results of the scan are errors and need redirection to output for grep
# | grep -E  succ|open (will display only open connections)
# & puts the scan into background to run all scans at the same time
