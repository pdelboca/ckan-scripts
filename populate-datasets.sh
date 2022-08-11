#!/bin/bash
# A simple script to add some datasets and resources to it.
#
# The main goal of this script is to create a database with some datasets and resources.

PACKAGE_DATA=""

RESOURCE_DATA=""

for i in {1..5}; do
  echo "Creating dataset $i"
  curl -X POST -H "Authorization: $API_TOKEN" -d "name=api-package-$i"$PACKAGE_DATA "http://localhost:5000/api/action/package_create"
  for j in {1..3}; do
    curl -H "Authorization: $API_TOKEN" -d "package_id=api-package-$i"$RESOURCE_DATA "http://localhost:5000/api/action/resource_create"
  done
  echo "Finished dataset $i"
done