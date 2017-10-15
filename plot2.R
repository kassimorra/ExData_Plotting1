library(readr)
library(dplyr)
library(lubridate)

setwd( '/Users/kassim/Documents/app/c4e1/ExData_Plotting1')
bs <- read_delim(file = "household_power_consumption.txt", delim = ";", col_names = T) 

bs <- bs %>% filter( mdy(Date) >= mdy('02/01/2007') & mdy(Date) <= mdy('02/02/2007') )
bs$datetime <- mdy_hms(paste(bs$Date, bs$Time))


plot(bs$Global_active_power ~ bs$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()