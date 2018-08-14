# Read in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")

# Format Date as date type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subsets data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converts dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Graph
par(mfcol = c(2,2))

with(data, {
    # plot upper left
    plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    
    # plot lower left
    plot(datetime, Sub_metering_1, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(datetime, Sub_metering_2, col='Red')
    lines(datetime, Sub_metering_3, col='Blue')

    legend("topright", col=c("black", "red", "blue"), lty=1, 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    # plot upper right
    plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    # plot lower right
    plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})

#PNG
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
