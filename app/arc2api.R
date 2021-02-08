# Title     : Arc2 API
# Objective : Return precipitation for Africa for given date, latitude and longitude
# Created by: Christoph Mussenbrock
# Created on: 06/02/2021

library(rnoaa)

#* Return the precipitation at a date for lat, lng bounding box location. When maximum parameters are skipped only the value for the mininum latitude/longitude is returned.
#* @param date date
#* @param latMin minimum latitude of bounding box
#* @param lngMin minimum longitude of bounding box
#* @param latMax maximum latitude of bounding box (optional parameter)
#* @param lngMax maximum longitude of bounding box (optional parameter)
#* @get /arc2
function(date="", latMin="", lngMin="", latMax="", lngMax="") {
   latMinFloat <- round(as.numeric(latMin), digits = 1)
   lngMinFloat <- round(as.numeric(lngMin), digits = 1)

   if(nchar(latMax) > 0) { latMaxFloat <- round(as.numeric(latMax), digits = 1) }
   else                  { latMaxFloat <- latMinFloat }
   
   if(nchar(lngMax) > 0) { lngMaxFloat <- round(as.numeric(lngMax), digits = 1) }
   else                  { lngMaxFloat <- lngMinFloat }
   
   box <- c(xmin = lngMinFloat, ymin = latMinFloat, xmax = lngMaxFloat + 0.01, ymax = latMaxFloat + 0.01)

   arc2(date, box = box)
}
