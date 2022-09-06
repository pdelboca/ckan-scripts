#!/bin/bash
# A simple script to explore dataset's metadata using jq.
#
# The main goal of this script is to document some usecases of jq to explore CKAN's data.
# This particular script requires ckanapi and jq installed

echo "Downloading metadata of all datasets from "$REMOTE" into datasets.json"
ckanapi search datasets -r $REMOTE -a $API_TOKEN > datasets.json 2>&1

echo "Datasets without the metadata_modified field: "
cat datasets.json | jq 'select(has("metadata_modified") | not)'

echo "Resources without the metadata_modified field: "
cat datasets.json | jq '.resources[]' | jq 'select(has("metadata_modified") | not)'
