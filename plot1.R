library(readr)
library(dplyr)
library(lubridate)

setwd( '/Users/kassim/Documents/app/c4e1/ExData_Plotting1')
bs <- read_delim(file = "household_power_consumption.txt", delim = ";", col_names = T) 

bs <- bs %>% filter( mdy(Date) >= mdy('02/01/2007') & mdy(Date) <= mdy('02/02/2007') )


hist(bs$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()