require(graphics)
plot2 <- function()
{
    # Call download_data.R to get the data on 2007/2/1 and 2007/2/2
    source("download_data.R")
    f_data <- download_data()
    # plot the global active power v.s. frequency
    png("plot2.png", width=480, height=480)
    
    # combine the Date/Time column to a single column
    
    f1_data <- f_data %>%
        mutate(DateTime=paste(Date, Time, sep=" "))
    
    plot(as.numeric(f1_data$Global_active_power) ~ as_datetime(f1_data$DateTime), 
         type="l", ylab="Global Active Power (in kilowatts)", xlab="DateTime")
    dev.off()
}