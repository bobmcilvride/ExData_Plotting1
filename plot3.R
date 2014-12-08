plot3 <- function() {
    
    # Plot energy sub metering values over a two day period
    
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
    f.out <- paste(getwd(), "plot3.png", sep="/")
    
    # define graphics device
    png(filename = f.out,
        width = 480, height = 480, units = "px", 
        pointsize = 11, bg = "white")
    
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

return("complete")    
}