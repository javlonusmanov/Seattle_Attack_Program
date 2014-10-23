#!/bin/bash

cd extra_credit;
for referencemonitor in extra_credit_*;
	do
		cd ..
		cd test_cases_extra
		for testcase in hs2619_extra_*;
			do
				cd ..
				if ls test_directory/extra_credit_* &> /dev/null;
				then
					rm test_directory/extra_credit_*;
				fi
				if ls test_directory/hs2619_extra_* &> /dev/null;
				then
					rm test_directory/hs2619_extra_*; 
				fi
				echo "Testing: $referencemonitor with $testcase";
				cp extra_credit/$referencemonitor test_directory/;
				cp test_cases_extra/$testcase test_directory/;
				cd test_directory;
				python repy.py restrictions.default encasementlib.r2py $referencemonitor $testcase; 
			done;
		# echo "";
		# read;
	done;