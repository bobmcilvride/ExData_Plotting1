## Author:  Robert McIlvride
## Platform:  OS X Yosemite version 10.10.1 (14B25)
## Environment:  RStudio Version 0.98.1091 
## Project:  ExData_Plotting1.Rproj
## Program:  plot2.R
## 
## Description:
## Plot power usage in two minute intervals for two days

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

# create/concatenate DateTime column
tbl$DateTime <- paste(tbl$Date, tbl$Time, " ")

# convert Date and DateTime to date classes
tbl <- transform(tbl, Date = as.Date(Date, format = "%d/%m/%Y"), 
                 DateTime = strptime(DateTime, format="%d/%m/%Y %H:%M:%S"))

# subset with specific dates
tbl <- tbl[tbl$Date %in% as.Date(c('2007-02-01', '2007-02-02'), format = "%Y-%m-%d"), ]

##
## Plot data
##

# define graphics devicen
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", 
    pointsize = 12, bg = "white")

# set up the plot 
plot(tbl$DateTime, 
     tbl$Global_active_power, 
     type = 'l',
     col = 'black',
     ylab = "Global Active Power (kilowatts)",
     xlab = ""
) 

# close graphics device
dev.off()

## End of program