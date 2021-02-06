# Title     : Arc2 API
# Objective : Return precipitation for Africa for given date, latitude and longitude
# Created by: Christoph Mussenbrock
# Created on: 06/02/2021

library(rnoaa)

#* Return the precipitation at a date for lat, lng location
#* @param date date
#* @param lat latitude
#* @param lng longitude
#* @get /arc2
function(date="", lat="", lng=""){

  latFloat <- round(as.numeric(lat), digits = 1)
  lngFloat <- round(as.numeric(lng), digits = 1)
  box <- c(xmin = lngFloat, ymin = latFloat, xmax = lngFloat + 0.01, ymax = latFloat + 0.01)
  arc2(date, box = box)
}
