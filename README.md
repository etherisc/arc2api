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

    docker run --rm -p 8000:8000 -v `pwd`/app:/app arc2api /app/arc2api.R
    
## API endpoints: 

| Endpoint | Description |
 :---|:---
`localhost:8000/__docs__/` | Interactive Swagger Docs
`curl -X GET "http://localhost:8000/arc2pixel?pixel=Pixel392578&date=2020-02-20&days=7" -H  "accept: */*"` | Example curl request for rainfall timeline for Pixel392578 from 2020-02-20 to 20-02-22 (3 days) 
`curl -X GET "http://localhost:8000/arc2?date=2020-04-18&latMin=36.6&lngMin=-1.5&latMax=37.1&lngMax=-1.1" -H  "accept: */*"` | Example curl request for Nairobi region on April 18 2020

The timeline response should look as shown below.

    {
        "2020-02-20": [
            {
                "date": "2020-02-20",
                "lon": 37.7,
                "lat": -0.9,
                "precip": 2.6784
            }
        ],
        "2020-02-21": [
            {
                "date": "2020-02-21",
                "lon": 37.7,
                "lat": -0.9,
                "precip": 0
            }
        ],
        "2020-02-22": [
            {
                "date": "2020-02-22",
                "lon": 37.7,
                "lat": -0.9,
                "precip": 0
            }
        ]
    }`


