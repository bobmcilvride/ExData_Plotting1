plot2 <- function() {

    # Plot power usage in two minute intervals for two days
    
    # set path to input file
    f <- paste(getwd(), "household_power_consumption.txt", sep="/")
    
    # read input file
    tbl <- read.table(f, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, comment.char = "")
    
    ## create/concatenate DateTime column
    tbl$DateTime <- paste(tbl$Date, tbl$Time, " ")
    
    ## convert Date and DateTime variables to classes
    tbl <- transform(tbl, Date = as.Date(Date, format = "%d/%m/%Y"), 
                     DateTime = strptime(DateTime, format="%d/%m/%Y %H:%M:%S"))
    
    # subset with specific dates
    tbl <- tbl[tbl$Date %in% as.Date(c('2007-02-01', '2007-02-02'), format = "%Y-%m-%d"), ]
    
    # set path for plot output file
    f.out <- paste(getwd(), "plot2.png", sep="/")
    
    # define graphics devicen
    png(filename = f.out,
        width = 640, height = 640, units = "px", 
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

return("complete")    
}