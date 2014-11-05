plot1 <- function() {

    # Our overall goal here is simply to examine how household energy usage 
    # varies over a 2-day period in February, 2007. Your task is to reconstruct 
    # the following plots below, all of which were constructed using the base 
    # plotting system.
    
    # Construct the plot and save it to a PNG file with a width of 480 pixels 
    # and a height of 480 pixels.
    
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
    f.out <- paste(getwd(),
                    "4 - Exploratory Data Analysis", 
                    "ExData_Plotting1",
                    "plot1.png", sep="/")
    
    # define graphics device
    png(filename = f.out,
        width = 480, height = 480, units = "px", 
        pointsize = 12, bg = "white")
    
    # plot histogram
    with(df.subset, hist(Global_active_power, 
                         col="red", 
                         main=("Global Active Power"),
                         xlab="Global Active Power (kilowatts)"))
    
    # close graphics device
    dev.off()

return("complete")    
}