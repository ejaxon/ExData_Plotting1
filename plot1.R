# Set the time period of interest
start <- as.Date("2007-01-31")
end <- as.Date("2007-02-03")

# Read the data
indata <- read.table(file="household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
# Extract rows from time period of interest, convert Date column to Date and Date/Time columns to DateTime
indata$Date <- as.Date(indata$Date, "%d/%m/%Y")
data <- subset(indata, (indata$Date > start & indata$Date < end))
data$DateTime <- strptime(paste(data$Date, data$Time, " "), "%Y-%m-%d %H:%M:%S")

png(filename="plot1.png")
hist(data$Global_active_power, main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)", col="red", axes=FALSE)

# par(cex.axis=.7) # Needed when drawing on screen to fit all labels on y axis.
# Draw the axes
axis(side=2, at=c(0, 200, 400, 600, 800, 1000, 1200), labels=TRUE, cex.axis=1.0)
axis(side=1,labels=TRUE, cex.axis=1.0)
dev.off()



