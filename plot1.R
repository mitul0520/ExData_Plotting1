#Define script parameters
filename <- "household_power_consumption.txt"
downloadLocation <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
tempFilename <- "tempDownloadfile.zip"

#Check if file exists, if not download and unzip the file
if(!file.exists(filename)){
  download.file(downloadLocation, tempFilename, method = "curl")
  unzip(tempFilename)

#Not deleting temp downloaded file. Just in case if it is needed.
#As a best
  
}

