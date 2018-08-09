#!/bin/bash

# Make sure pwd is script path
cd "$(dirname "$0")"

# Create data and download files into it
mkdir ./data
wget -r -np -l 1 -A gz -nH --cut-dirs=1 --directory-prefix=data https://datasets.imdbws.com/

# Unpack data
echo "Download complete.  Unzipping data."
cd data
gunzip *.gz
cd ..

# Create database and import
rm imdb.db
echo "Creating database."
sqlite3 imdb.db < import.sql

# Cleanup
rm ./data/*.tsv

echo "Process completed.  imdb.db created."
