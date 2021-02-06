#!/usr/bin/env bash

docker run --rm -p 8000:8000 -v `pwd`/app:/app arc2api /app/arc2api.R >log.out

