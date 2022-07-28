#!/bin/bash

echo 'To test one file pass filename as first param'
echo 'e.g. sudo ./continous_test.sh test_JobExecution.py'

if [ $# -eq 0 ]; then
  until ack -f --python  ./python_Testing_Utilities ./tests | entr -d pytest ./tests; do sleep 1; done
else
  until ack -f --python  ./python_Testing_Utilities ./tests | entr -d pytest ./tests/${1}; do sleep 1; done
fi

