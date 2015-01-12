plot1 <- function() {

    # Plot the distributioni of power usesage for a two day period
    
    # Presumes that the proper input file has been downloaded from the source and placed in the working directory
    # Source file location is:  https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
    
    # set path to input file
    f <- paste(getwd(), "household_power_consumption.txt", sep="/")
    
    # read input file
    tbl <- read.table(f, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, comment.char = "")
    
    # Convert Date to date class
    tbl <- transform(tbl, Date = as.Date(Date, format = "%d/%m/%Y"))
    
    # subset with specific dates
    tbl <- tbl[tbl$Date %in% as.Date(c('2007-02-01', '2007-02-02'), format = "%Y-%m-%d"), ]
    
    # set path for plot output file
    f.out <- paste(getwd(), "plot1.png", sep="/")
    
    # define graphics device
    png(filename = f.out,
        width = 480, height = 480, units = "px", 
        pointsize = 12, bg = "white")
    
    # plot histogram
    with(tbl, hist(Global_active_power, 
                         col="red", 
                         main=("Global Active Power"),
                         xlab="Global Active Power (kilowatts)"))
    
    # close graphics device
    dev.off()

return("complete")    
}