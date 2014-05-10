##File to create the plot3.png
##Assuming the data file is in the same directory as the code

#Vector representing the column header data type
myCols<-c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')

#Read the text file
#Handle missing values while reading the text file
myData <- read.table('household_power_consumption.txt', sep=';', header=TRUE, colClasses=myCols, na.strings='?')
myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
myData <- subset(myData, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

# Create plot3.png
png("plot3.png", height=480, width=480)

# Build the graph
plot(myData$DateTime, myData$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(myData$DateTime, myData$Sub_metering_1)
lines(myData$DateTime, myData$Sub_metering_2, col='red')
lines(myData$DateTime, myData$Sub_metering_3, col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'))

# Close PNG file
dev.off()
