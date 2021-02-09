# ARC2 API

This API is a simple wrapper around the arc2 function of the rnoaa package of R.

For information on the `rnoaa` package, see https://docs.ropensci.org/rnoaa/articles/rnoaa.html

For information on ARC2 data, see ftp://ftp.cpc.ncep.noaa.gov/fews/fewsdata/africa/arc2/ARC2_readme.txt

## Installation

Clone the repo:  

    git clone git@github.com:etherisc/arc2api.git

Build docker image: 

    docker build -t arc2api .

Run docker container: 

    ./bin/run

Or directly via docker:

    docker run --rm -p 8000:8000 -v `pwd`/app:/app arc2api /app/arc2api.R > log.out
    
## API endpoints: 

| Endpoint | Description |
 :---|:---
`curl -X GET "http://localhost:8000/arc2?date=2020-04-18&latMin=36.6&lngMin=-1.5&latMax=37.1&lngMax=-1.1" -H  "accept: */*"` | Example curl request for Nairobi region on April 1818 2020
`localhost:8000/__docs__/` | Interactive Swagger Docs

