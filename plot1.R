require(graphics)
plot1 <- function()
{
    # Call download_data.R to get the data on 2007/2/1 and 2007/2/2
    source("download_data.R")
    f_data <- download_data()
        
    
    # plot the global active power v.s. frequency
    png("plot1.png", width=480, height=480)
    hist(as.numeric(f_data$Global_active_power), main="Global Active Power",xlab="Global Active Power (in kilowatts)", col="red")
    dev.off()
    
}