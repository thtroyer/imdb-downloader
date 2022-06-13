#!/bin/bash
# Check script dependencies
command -v wget >/dev/null 2>&1 || {
  echo >&2 "Cannot locate wget. Is it installed? Aborting."
  exit 1
}
command -v gunzip >/dev/null 2>&1 || {
  echo >&2 "Cannot locate gunzip. Is it installed? Aborting."
  exit 1
}
command -v sqlite3 >/dev/null 2>&1 || {
  echo >&2 "Cannot locate sqlite3. Is it installed? Aborting."
  exit 1
}

# Make sure pwd is script path
cd "$(dirname "$0")" || exit

# Create data and download files into it
mkdir ./data
echo "----------------------------------"
echo "Downloading data."
sleep 3
wget -r -np -l 1 -A gz -nH --cut-dirs=1 --directory-prefix=data https://datasets.imdbws.com/

# Unpack data
echo "----------------------------------"
echo "Download complete.  Unzipping data."
sleep 3
(
  cd data || exit
  gunzip *.gz
)

# Convert quotes
echo "----------------------------------"
echo "Escaping quotes for sqlite import."
sleep 3
(
  cd data || exit
  sed -i 's/\"/\\\"/g' *.tsv
)

# Create database and import
rm imdb.db
echo "----------------------------------"
echo "Creating database."
sleep 3
sqlite3 imdb.db <import.sql

# Cleanup
rm -r ./data

echo "----------------------------------"
echo "Process completed.  imdb.db created."
echo "----------------------------------"
