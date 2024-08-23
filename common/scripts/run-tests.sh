#!/bin/bash

while getopts 'c' OPTION; do
  case "$OPTION" in
    c)
        RUN_COVERALLS=1;;
    ?)
        RUN_COVERALLS=0;
        exit 1;;
  esac
done
shift "$(($OPTIND -1))"

if [ -n "$1" ]; then
    echo "[ckan-test.run-tests] Running pytest --cov=$1 --ckan-ini=test.ini tests"
    pytest --ckan-ini=test.ini --cov="$1" --cov-report=term-missing --cov-append --disable-warnings tests
    test_exit_code=$?
else
    echo "[ckan-test.run-tests] Running pytest --ckan-ini=test.ini tests"
    pytest --ckan-ini=test.ini --cov-report=term-missing --cov-append --disable-warnings tests
    test_exit_code=$?
fi

if [ "$RUN_COVERALLS" = 1 ]; then
    coveralls;
fi

exit $test_exit_code
