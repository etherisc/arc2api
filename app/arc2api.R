#* @apiTitle       Arc2 REST API
#* @apiDescription Return precipitation for Africa for given date, latitude and longitude
#* @apiContact     list(name = "Contact", url = "https://github.com/etherisc/arc2api", email = "christoph.mussenbrock@etherisc")
# Created on: 06/02/2021

library(rnoaa)

#* Return the precipitation at a date for lat, lng bounding box location. 
#* When maximum parameters are skipped only the value for the mininum latitude/longitude is returned.
#* Example data for some precipitation in Nairobi in April 2020
#* - date: 2020-04-18
#* - lat/long bounding box min values: 36.6, -1.5
#* - lat/long bounding box max values: 37.1, -1.1 
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
