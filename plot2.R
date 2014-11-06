plot2 <- function() {

    # Our overall goal here is simply to examine how household energy usage 
    # varies over a 2-day period in February, 2007. Your task is to reconstruct 
    # the following plots below, all of which were constructed using the base 
    # plotting system.
    
    # set path to input file
    f <- paste(getwd(), "household_power_consumption.txt", sep="/")
    
    #read input file
    df.input <- data.frame(read.table(f, header = TRUE, 
                                      comment.char="",
                                      sep = ";", 
                                      na.strings="?"))
    
    # subset with specific dates
    df.subset <- df.input[which(
        as.Date(as.character(df.input$Date), format = "%d/%m/%Y") >= "2007-02-01" & 
        as.Date(as.character(df.input$Date), format = "%d/%m/%Y") <= "2007-02-02"),]
        
    # set path for plot output file
    f.out <- paste(getwd(), "plot2.png", sep="/")
    
    # define graphics devicen
    png(filename = f.out,
        width = 480, height = 480, units = "px", 
        pointsize = 12, bg = "white")
        
    # set up the plot 
    plot(strptime(as.character(paste(df.subset$Date, df.subset$Time)), format = "%d/%m/%Y %H:%M:%S"), 
        df.subset$Global_active_power, 
        type = 'l',
        col = 'black',
        ylab = "Global Active Power (kilowatts)",
        xlab = ""
        ) 
        
    # close graphics device
    dev.off()

return("complete")    
}