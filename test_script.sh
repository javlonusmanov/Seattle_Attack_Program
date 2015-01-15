#!/bin/bash
ulimit -t 10
cd reference_monitors;
for referencemonitor in reference_monitor_*;
	do
		cd ..
		cd test_cases
		for testcase in hs2619_*;
			do
				cd ..
				if ls repy/reference_monitor_* &> /dev/null;
				then
					rm repy/reference_monitor_*;
				fi
				if ls repy/hs2619_* &> /dev/null;
				then
					rm repy/hs2619_*; 
				fi
				echo "Testing: $referencemonitor with $testcase";
				cp reference_monitors/$referencemonitor repy/;
				cp test_cases/$testcase repy/;
				cd repy;
				python repy.py restrictions.default encasementlib.r2py $referencemonitor $testcase; 
			done;
		echo "";
	done;

