plot1 <- function() {

    # Our overall goal here is simply to examine how household energy usage 
    # varies over a 2-day period in February, 2007. Your task is to reconstruct 
    # the following plots below, all of which were constructed using the base 
    # plotting system.
    
    # set path to input file
    f <- paste(getwd(), "household_power_consumption.txt", sep="/")
    
    # read input file
    tbl <- read.table(f, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, comment.char = "")
    
    # Convert Date to a class
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