# Set the time period of interest
start <- as.Date("2007-01-31")
end <- as.Date("2007-02-03")

# Read the data
indata <- read.table(file="household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
# Extract rows from time period of interest, convert Date column to Date and Date/Time columns to DateTime
indata$Date <- as.Date(indata$Date, "%d/%m/%Y")
data <- subset(indata, (indata$Date > start & indata$Date < end))
data$DateTime <- strptime(paste(data$Date, data$Time, " "), "%Y-%m-%d %H:%M:%S")

png(filename="plot3.png")

plot(data$DateTime, data$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1)

dev.off()



