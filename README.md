# imdb-downloader
IMDb provides a data dump in tsv format for noncommercial use here: https://www.imdb.com/interfaces/  This script simply downloads the data and imports it into a sqlite database so it can be queried.

## Requirements
Bash

sqlite3

wget

## Usage
    git clone git@github.com:thtroyer/imdb-downloader.git
    cd imdb-downloader
    ./run.sh
