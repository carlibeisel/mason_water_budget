## ------------------ ##
## RETRIEVE USGS DATA ##
## ------------------ ##

# By Carli Beisel
# Adapted from Bridget Bittmann (2023, Github: bridgetmarie24)
# Date adapted: July 14, 2024
#PURPOSE: Retrieve USGS streamflow data for Mason Creek.

install.packages('dataRetrieval')
library(dataRetrieval)

#Input gauge site numbera and the parameter ID for discharge
siteNumber <- "13210980"
info <- readNWISsite(siteNumber)
parameterCd <- "00060"

# Import raw daily data
rawdailydata <- readNWISdv(siteNumber, parameterCd, '2024-01-01', '2024-10-25')
rawdailydata$DiversionName <- 'MASON CREEK AT CALDWELL ID'

# Export csv file
write.csv(file="/Users/dbeisel/Desktop/mason_usgs.csv", rawdailydata)
