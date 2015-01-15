#!/bin/bash

cd reference_monitors_extra_credit;
for referencemonitor in extra_credit_*;
	do
		cd ..
		cd test_cases_extra_credit
		for testcase in hs2619_extra_*;
			do
				cd ..
				if ls repy/extra_credit_* &> /dev/null;
				then
					rm repy/extra_credit_*;
				fi
				if ls repy/hs2619_extra_* &> /dev/null;
				then
					rm repy/hs2619_extra_*; 
				fi
				echo "Testing: $referencemonitor with $testcase";
				cp reference_monitors_extra_credit/$referencemonitor repy/;
				cp test_cases_extra_credit/$testcase repy/;
				cd repy;
				python repy.py restrictions.default encasementlib.r2py $referencemonitor $testcase; 
			done;
		# echo "";
		# read;
	done;