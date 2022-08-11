#!/bin/bash
# A simple script to add some datasets and update them.
#
# The main goal of this script is to create a database with a lot of activities to test some performance changes.

EXTRA_PACKAGE_DATA=""

for i in {1..10}; do
  echo "Creating dataset $i"
  curl -X POST -H "Authorization: $API_TOKEN" -d "name=api-package-$i"$EXTRA_PACKAGE_DATA "http://localhost:5000/api/action/package_create" > /dev/null 2>&1
  for j in {1..10000}; do
    curl -H "Authorization: $API_TOKEN" -d "notes=Update from API:$j&id=api-package-$i" "http://localhost:5000/api/action/package_update" > /dev/null 2>&1
  done
done
