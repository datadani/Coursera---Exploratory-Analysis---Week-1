# Read in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")

# Format Date as date type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subsets data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converts dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Graph
with(data, {
    plot(datetime, Sub_metering_1, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(datetime, Sub_metering_2, col='Red')
    lines(datetime, Sub_metering_3, col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#PNG
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
