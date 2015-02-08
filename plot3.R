## Author:  Robert McIlvride
## Platform:  OS X Yosemite version 10.10.1 (14B25)
## Environment:  RStudio Version 0.98.1091 
## Project:  ExData_Plotting1.Rproj
## Program:  plot3.R
## 
## Description:
## Plot energy sub metering values over a two day period

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

# define graphics device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", 
    pointsize = 12, bg = "white")

# get the range for the x and y axis 
xrange <- range(tbl$DateTime) 
yrange <- range(as.numeric(cbind(tbl$Sub_metering_1, tbl$Sub_metering_2, tbl$Sub_metering_3))) 

# set up the plot 
plot(xrange, yrange, 
     type = 'n',
     xlab = "",
     ylab = "Energy sub metering"
)

# add lines to plot
lines(tbl$DateTime,tbl$Sub_metering_1,col="black") 
lines(tbl$DateTime,tbl$Sub_metering_2,col="red")
lines(tbl$DateTime,tbl$Sub_metering_3,col="blue") 

# add legend to plot
legend('topright',
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black","red","blue")
)

# close graphics device
dev.off()

## End of program