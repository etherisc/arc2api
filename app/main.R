# Title     : Arc2 API
# Objective : Provide simple API for
# Created by: christoph
# Created on: 2/6/21

library(plumber)

api <-pr("plumber.R")
pr_run(api, port=8000)
