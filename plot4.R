##File to create the plot4.png
##Assuming the data file is in the same directory as the code

#Vector representing the column header data type
myCols<-c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')

#Read the text file
#Handle missing values while reading the text file
myData <- read.table('household_power_consumption.txt', sep=';', header=TRUE, colClasses=myCols, na.strings='?')
myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
myData <- subset(myData, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

# Create plot4.png
png("plot4.png", height=480, width=480)

# Multiplot
par(mfrow=c(2,2))

# Global Active Power plot
plot(myData$DateTime, myData$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)")
lines(myData$DateTime, myData$Global_active_power)

# Voltage plot
plot(myData$DateTime, myData$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(myData$DateTime, myData$Voltage)

# Submetering plot
plot(myData$DateTime, myData$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(myData$DateTime, myData$Sub_metering_1)
lines(myData$DateTime, myData$Sub_metering_2, col='red')
lines(myData$DateTime, myData$Sub_metering_3, col='blue')
label <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend('topright', label, lty = c(1,1,1), col = c('black', 'red', 'blue'), bty = 'n')

# Global reactive power plot
with(myData, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(myData, lines(DateTime, Global_reactive_power))

# Close PNG file
dev.off()
