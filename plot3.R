require(graphics)
plot3 <- function()
{
    # Call download_data.R to get the data on 2007/2/1 and 2007/2/2
    source("download_data.R")
    f_data <- download_data()
    # plot the global active power v.s. frequency
    png("plot3.png", width=480, height=480)
    
    # combine the Date/Time column to a single column
    
    f1_data <- f_data %>%
        mutate(DateTime=paste(Date, Time, sep=" "))
    # First draw nothing
    DT <- as_datetime(f1_data$DateTime)
   
    plot(as.numeric(f1_data$Sub_metering_1) ~ DT, 
         type="l", ylab="Energy submetering", xlab="DateTime")
    points(f1_data$Sub_metering_2~DT, type="l", col="red")
    points(f1_data$Sub_metering_3~DT, type="l", col="blue")    
    legend(x="topright",legend=c("Submetering_1", "Submetering_2", "Submetering_3"), 
           lwd=2, col=c("black", "red", "blue"))
    dev.off()
}
