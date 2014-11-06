plot4 <- function() {
    
    # Our overall goal here is simply to examine how household energy usage 
    # varies over a 2-day period in February, 2007. Your task is to reconstruct 
    # the following plots below, all of which were constructed using the base 
    # plotting system.
    
    # set path to input file
    f <- paste(getwd(), "household_power_consumption.txt", sep="/")
    
    # read input file
    df.input <- data.frame(read.table(f, header = TRUE, 
                                      comment.char="",
                                      sep = ";", 
                                      na.strings="?"))
    
    # subset with specific dates
    df.subset <- df.input[which(
        as.Date(as.character(df.input$Date), format = "%d/%m/%Y") >= "2007-02-01" & 
            as.Date(as.character(df.input$Date), format = "%d/%m/%Y") <= "2007-02-02"),]

    # set path for plot output file
    f.out <- paste(getwd(), "plot4.png", sep="/")
    
    # define graphics device
    png(filename = f.out,
        width = 480, height = 480, units = "px", 
        pointsize = 12, bg = "white")
    
    # set 2x2 plot grid
    par(mfrow=c(2,2))
    
    #######################################################
    # Plot #1
    #######################################################
    plot(strptime(as.character(paste(df.subset$Date, df.subset$Time)), format = "%d/%m/%Y %H:%M:%S"), 
         df.subset$Global_active_power, 
         type = 'l',
         col = 'black',
         ylab = "Global Active Power",
         xlab = ""
    ) 
    
    #######################################################
    # Plot #2
    #######################################################
    plot(strptime(as.character(paste(df.subset$Date, df.subset$Time)), format = "%d/%m/%Y %H:%M:%S"), 
         df.subset$Voltage, 
         type = 'l',
         col = 'black',
         ylab = "Voltage",
         xlab = "datetime"
    ) 
    
    #######################################################
    # Plot #3
    #######################################################
    # get the range for the x and y axis 
    xrange <- range(strptime(as.character(paste(df.subset$Date, df.subset$Time)), format = "%d/%m/%Y %H:%M:%S")) 
    yrange <- range(as.numeric(cbind(df.subset$Sub_metering_1, df.subset$Sub_metering_2, df.subset$Sub_metering_3))) 
    
    # set up the plot 
    plot(xrange, yrange, 
         type = 'n',
         xlab = "",
         ylab = "Energy sub metering"
    )
    
    # add lines to plot
    lines(strptime(as.character(paste(df.subset$Date, df.subset$Time)), format = "%d/%m/%Y %H:%M:%S"),df.subset$Sub_metering_1,col="black") 
    lines(strptime(as.character(paste(df.subset$Date, df.subset$Time)), format = "%d/%m/%Y %H:%M:%S"),df.subset$Sub_metering_2,col="red")
    lines(strptime(as.character(paste(df.subset$Date, df.subset$Time)), format = "%d/%m/%Y %H:%M:%S"),df.subset$Sub_metering_3,col="blue") 
    
    # add legend to plot
    legend('topright',
           c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lty=c(1,1,1),
           bty = "n",
           col=c("black","red","blue")
    )
    
    #######################################################
    # Plot #4
    #######################################################
    plot(strptime(as.character(paste(df.subset$Date, df.subset$Time)), format = "%d/%m/%Y %H:%M:%S"), 
         df.subset$Global_reactive_power, 
         type = 'l',
         col = 'black',
         ylab = "Global_reactive_power",
         xlab = "datetime"
    ) 
    
    # close graphics device
    dev.off()

return("complete")    
}