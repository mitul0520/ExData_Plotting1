## Load library
library(sqldf)

## Define script parameters
filename <- "household_power_consumption.txt"
downloadLocation <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
tempFilename <- "tempDownloadfile.zip"
graphFile <- "plot2.png"

## Check if file exists, if not download and unzip the file
if(!file.exists(filename)){
  download.file(downloadLocation, tempFilename, method = "curl")
  unzip(tempFilename)

## Not deleting temp downloaded file. Just in case if it is needed.
## As a best
  
}

## Read file, data from the dates 2007-02-01 and 2007-02-02

df <- read.csv.sql(filename, sep=";",
        sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")')

## open png device
png(filename = graphFile)

## create plot
dt <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")
plot(dt, df$Global_active_power, xlab='', ylab='Global Active Power(kilowatts)' , pch = '.')
lines(dt, df$Global_active_power)

## close png device
dev.off()


## close any connections that may still be open:
closeAllConnections()

## garbage collection to be safe:
gc()

