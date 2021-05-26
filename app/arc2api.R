#* @apiTitle       ARC2 API
#* @apiDescription Return satellite precipitation for Africa for given date and location.
#* See the [ARC2 online documentation](https://iridl.ldeo.columbia.edu/SOURCES/.NOAA/.NCEP/.CPC/.FEWS/.Africa/.DAILY/.ARC2/.daily/.dataset_documentation.html) for details.
#* Under the hood the official [Noaa ARC2 R package](https://rdrr.io/cran/rnoaa/src/R/arc2.R) is used.
#* @apiContact     list(name = "Contact", url = "https://github.com/etherisc/arc2api", email = "christoph.mussenbrock@etherisc")
# Created on:      06/02/2021

library(rnoaa)


#* Return the precipitation for the specified pixel location and date sequence
#* @param pixel location of interest (example: Pixel390562)
#* @param date start date (example: 2020-04-16)
#* @param days optional number of days starting with start date (example: 7, default: 1)
#* @get /arc2pixel
function(pixel="Pixel392578", date="2020-02-20", days="1") {

   latPix <- as.numeric(substring(pixel, 6, 8))
   lngPix <- as.numeric(substring(pixel, 9, 11))

   latitude <- (latPix - 401) / 10.0
   longitude <- (lngPix - 201) / 10.0

   print(c("location", pixel, "latitude", latitude, "longitude", longitude))

   if(rlang::is_empty(days) | nchar(days) == 0) {
      daysInt <- 1
   } else {
      daysInt <- round(as.numeric(days), digits = 0)
   }
   dateSequence <- seq(as.Date(date), by = "day", length.out = daysInt)
   area <- c(xmin = longitude, ymin = latitude, xmax = longitude + 0.01, ymax = latitude + 0.01)

   print(c("dates", dateSequence))
   print(c("area", area))

   arc2(date = dateSequence, box = area)
}

#* Return the precipitation at a date (sequence) for lat, lng bounding box location.
#* @param dateStart start date (example: 2020-04-16)
#* @param days optional number of days starting with start date (example: 7, default: 1)
#* @param latitudeMin minimum latitude of bounding box (example: -1.5 for 1.5 S)
#* @param longitudeMin minimum longitude of bounding box (example value: 36.6 for 36.6 E)
#* @param latitudeMax optional maximum latitude of bounding box (example: -1.1, default: latitudeMin)
#* @param longitudeMax optional maximum longitude of bounding box (example value: 37.1, default: longitudeMin)
#* @get /arc2
function(dateStart="2020-04-16", days="1", latitudeMin="-1.5", longitudeMin="36.6", latitudeMax="", longitudeMax="") {
   if(rlang::is_empty(days) | nchar(days) == 0) {
      daysInt <- 1
   } else {
      daysInt <- round(as.numeric(days), digits = 0)
   }

   latMinFloat <- round(as.numeric(latitudeMin), digits = 1)
   lngMinFloat <- round(as.numeric(longitudeMin), digits = 1)

   if(rlang::is_empty(latitudeMax) | nchar(latitudeMax) == 0) {
      print(c("a", latitudeMax))
      latMaxFloat <- latMinFloat
   } else {
      print(c("b", latitudeMax))
      latMaxFloat <- round(as.numeric(latitudeMax), digits = 1)
   }

   if(rlang::is_empty(longitudeMax) | nchar(longitudeMax) == 0) {
      print(c("c", longitudeMax))
      lngMaxFloat <- lngMinFloat
   } else {
      print(c("d", longitudeMax))
      lngMaxFloat <- round(as.numeric(longitudeMax), digits = 1)
   }

   dateSequence <- seq(as.Date(dateStart), by = "day", length.out = daysInt)
   area <- c(xmin = lngMinFloat, ymin = latMinFloat, xmax = lngMaxFloat + 0.01, ymax = latMaxFloat + 0.01)

   print(c("dates", dateSequence))
   print(c("area", area))

   arc2(date = dateSequence, box = area)
}
