## Author:  Robert McIlvride
## Platform:  OS X Yosemite version 10.10.1 (14B25)
## Environment:  RStudio Version 0.98.1091 
## Project:  ExData_Plotting1.Rproj
## Program:  plot1.R
## 
## Description:
## Plot the distributioni of power usesage for a two day period

##
## Download and extract files
##

if(!file.exists("./raw_data/")){dir.create("./raw_data/")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileUrl, temp, method = "curl")
unzip(temp, exdir = "./raw_data")
unlink(temp)

##
## Prepare data for plot
##

# read input file
tbl <- read.table("./raw_data/household_power_consumption.txt", header = TRUE, sep = ";", 
                  na.strings = "?", stringsAsFactors = FALSE, comment.char = "")

# Convert Date to date class
tbl <- transform(tbl, Date = as.Date(Date, format = "%d/%m/%Y"))

# subset with specific dates
tbl <- tbl[tbl$Date %in% as.Date(c('2007-02-01', '2007-02-02'), format = "%Y-%m-%d"), ]

##
## Plot data
##

# define graphics device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", 
    pointsize = 12, bg = "white")

# plot histogram
with(tbl, hist(Global_active_power, 
               col="red", 
               main=("Global Active Power"),
               xlab="Global Active Power (kilowatts)"))

# close graphics device
dev.off()

## End of program