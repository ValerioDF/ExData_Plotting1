# Load data
datafile <- "/Users/Pezzenti/Desktop/R course/data/household_power_consumption.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")

# Convert to Date/Time clsases
data[,1] <- as.Date(data$Date,"%d/%m/%Y")

# Create a subset of the data between 2007-02-01 and 2007-02-02
subData <- subset(data, data$Date %in% as.Date(c("2007-02-01","2007-02-02")))

subData$DateTime <- as.POSIXct(paste(subData$Date, subData$Time), format="%Y-%m-%d %H:%M:%S")


# Create plot 2
plot(subData$DateTime, subData[,3], type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

# Copy to PNG file for submission
dev.copy(png, file = "plot2.png")

# Close device
dev.off()