#!/bin/bash

cd reference_monitors;
for referencemonitor in reference_monitor_*;
	do
		cd ..
		cd test_cases
		for testcase in hs2619_*;
			do
				cd ..
				if ls test_directory/reference_monitor_* &> /dev/null;
				then
					rm test_directory/reference_monitor_*;
				fi
				if ls test_directory/hs2619_* &> /dev/null;
				then
					rm test_directory/hs2619_*; 
				fi
				echo "Testing: $referencemonitor with $testcase";
				cp reference_monitors/$referencemonitor test_directory/;
				cp test_cases/$testcase test_directory/;
				cd test_directory;
				python repy.py restrictions.default encasementlib.r2py $referencemonitor $testcase; 
			done;
		echo "";
		# read;
	done;

