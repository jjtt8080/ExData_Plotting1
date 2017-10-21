# Download the dataset:
download_data <- function()
{
    if (!file.exists("power.zip"))
    {
        url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, "power.zip", method="libcurl")
        unzip("power.zip")
    }
    require(lubridate)
    require(dplyr)
    require(jpeg)
    data <- read.table("household_power_consumption.txt", sep=";",header=TRUE, na.strings="?")
    # only get the 2007 2/1 and 2007 2/2's data
    f_data <- data %>% 
        na.exclude(data$Date) %>%
        mutate(Date=dmy(Date)) %>%
        filter(year(Date) == 2007) %>%
        filter(month(Date) == 2) %>%
        filter(day(Date) == 1 | day(Date)==2)
    
    f_data
}