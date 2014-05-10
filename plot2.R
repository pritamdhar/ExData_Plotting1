##File to create the plot2.png
##Assuming the data file is in the same directory as the code

#Vector representing the column header data type
myCols<-c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')

#Read the text file
#Handle missing values while reading the text file
myData <- read.table('household_power_consumption.txt', sep=';', header=TRUE, colClasses=myCols, na.strings='?')
myData$DateTime <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")
myData <- subset(myData, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

# Create plot2.png
png("plot2.png", height=480, width=480)

# Build the graph
plot(myData$DateTime, myData$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)")
lines(myData$DateTime, myData$Global_active_power)

# Close PNG file
dev.off()
