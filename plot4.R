require(graphics)
plot4 <- function()
{
  # Call download_data.R to get the data on 2007/2/1 and 2007/2/2
  source("download_data.R")
  f_data <- download_data()
  # plot the global active power v.s. frequency
  png("plot4.png", width=480, height=480)
  
  # combine the Date/Time column to a single column
  
  f1_data <- f_data %>%
    mutate(DateTime=paste(Date, Time, sep=" "))
  
  # First draw nothing
  DT <- as_datetime(f1_data$DateTime)
  
  # we need to combine multiple plots
  # in a 2 by 2 layout
  par(mfrow=c(2, 2))
  # f1
  plot(as.numeric(f1_data$Global_active_power) ~ DT, 
       type="l", ylab="Global active power")
  # f2
  plot(as.numeric(f1_data$Voltage) ~ DT, 
       type="l", ylab="Voltage", xlab="datetime")
  # f3
  plot(as.numeric(f1_data$Sub_metering_1) ~ DT, 
       type="l", ylab="Energy submetering")
  points(f1_data$Sub_metering_2~DT, type="l", col="red")
  points(f1_data$Sub_metering_3~DT, type="l", col="blue")
  legend(x="topright",legend=c("Submetering_1", "Submetering_2", "Submetering_3"))
  
  #f4
  plot(as.numeric(f1_data$Global_reactive_power) ~DT, 
       type = "l", ylab="Global Reactive Power", xlab="datetime")
  
  dev.off()
  
                               
}