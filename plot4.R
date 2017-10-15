
setwd( '/Users/kassim/Documents/app/c4e1/ExData_Plotting1')
bs <- read.table("household_power_consumption.txt", header = T, 
                 sep = ";", na.strings = "?")
attach(bs)
bs$Date <- as.Date(bs$Date, format = "%d/%m/%Y")
bs <- subset(bs, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

bs$datetime <- strptime(paste(bs$Date, bs$Time), "%Y-%m-%d %H:%M:%S")

bs$datetime <- as.POSIXct(bs$datetime)

par(mfrow = c(2, 2))
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
     xlab = "")
plot(Voltage ~ datetime, type = "l")
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(Global_reactive_power ~ datetime, type = "l")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
detach()
