# Load data
datafile <- "/Users/Pezzenti/Desktop/R course/data/household_power_consumption.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

# Convert to Date/Time clsases
data[,1] <- as.Date(myData$Date,"%d/%m/%Y")

# Create a subset of the data between 2007-02-01 and 2007-02-02
subData <- subset(data, data$Date %in% as.Date(c("2007-02-01","2007-02-02")))

subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time), format="%Y-%m-%d %H:%M:%S")


# Create plot 3
plot(subData$DateTime, subData[,7], type = "l", xlab = " ", ylab = "Energy sub metering")
lines(subData[,10], subData[,8], col = "Red")
lines(subData[,10], subData[,9], col = "Blue")
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black","Red","Blue"), lwd = 1)

# Copy to PNG file for submission
dev.copy(png,file="plot3.png")

# Close device
dev.off()