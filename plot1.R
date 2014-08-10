## Load library
library(sqldf)

## Define script parameters
filename <- "household_power_consumption.txt"
downloadLocation <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
tempFilename <- "tempDownloadfile.zip"

## Check if file exists, if not download and unzip the file
if(!file.exists(filename)){
  download.file(downloadLocation, tempFilename, method = "curl")
  unzip(tempFilename)

## Not deleting temp downloaded file. Just in case if it is needed.
## As a best
  
}

## Read file, data from the dates 2007-02-01 and 2007-02-02

df <- read.csv.sql(filename, sep=";",
        sql = 'select * from file where Date in ("2/1/2007", "2/2/2007")')

## open png device
png(filename = 'plot1.png')

## create plot
hist(df$Global_active_power, xlab = "Global Active Power(kilowatts)", 
     col="red", main="Global Active Power", xlim=c(0,6))

## close png device
dev.off()
