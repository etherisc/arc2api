# ARC2 API

This API is a simple wrapper around the arc2 function of the rnoaa package of R.

For information on the `rnoaa` package, see https://docs.ropensci.org/rnoaa/articles/rnoaa.html

For information on ARC2 data, see ftp://ftp.cpc.ncep.noaa.gov/fews/fewsdata/africa/arc2/ARC2_readme.txt

## Installation

Clone the repo:  


    git clone git@github.com:etherisc/arc2api.git

Build docker image: 


    docker build -t arc2api

Run docker container: 


    ./bin/run

API endpoints: 

| Endpoint | Description |
 :---|:---
`curl -X GET "localhost:8000/arc2?date={date}&lat={lat}&lng={lng}" -H "accept: */*"` | Request precipitation for date, latitude = lat and longitude = lng
`localhost:8000/__docs__/` | Interactive Swagger Docs

