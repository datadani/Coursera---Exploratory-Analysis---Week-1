# Read in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")

# Format Date as date type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subsets data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converts dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Graph
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

#PNG
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
