# imdb-downloader
IMDb provides a data dump for noncommercial use here: https://www.imdb.com/interfaces/

Unfortunately, the data provided is in [tsv](https://en.wikipedia.org/wiki/Tab-separated_values) format and the files are quite large and difficult to work with and join across.  

This script downloads zipped files, extracts them, and imports the data into a sqlite database so that queries can be written against it.

## Requirements

Linux or Linux-like environment with the following packages installed:
- Bash
- sqlite3
- wget
- gunzip

## Usage
```shell
git clone git@github.com:thtroyer/imdb-downloader.git
cd imdb-downloader
./run.sh
```

Open the resulting imdb.db in your favorite sqlite tool and then you can run queries like this:

```sqlite
-- Show all movies/shows, ordered by highest rating first
SELECT *
FROM title_basics AS tb
INNER JOIN title_ratings AS tr ON tb.tconst = tr.tconst
ORDER BY CAST(numVotes AS number) DESC;
```



