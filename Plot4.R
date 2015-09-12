## Step 1: Read in packages from the base
library(graphics)
library(grDevices)

## Step 2: Read in data and take only febuary 1 and 2, 2007. Also convert date/time variables to date/time class
hpc <- read.table(file = "household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hpcsub <- hpc[as.character(hpc$Date) %in% c("1/2/2007" , "2/2/2007"),]
hpcsub$Datetime <- strptime(paste(hpcsub$Date, hpcsub$Time), "%d/%m/%Y %H:%M:%S")

## Step 3: Start the PNG device
png(filename = "Plot4.png", width = 480, height = 480)

## Step 4: Specify mrow
par(mfrow = c(2,2))

## Step 5.1: Plot top left graph - date vs global active power
plot(hpcsub$Datetime, as.numeric(hpcsub$Global_active_power), type = "l", ylab = "Global Active Power", xlab = "")
## Step 5.2: Plot top right graph - date vs voltage
plot(hpcsub$Datetime, as.numeric(hpcsub$Voltage), type = "l", ylab = "Voltage", xlab = "Datetime")
## Step 5.3: Plot bottom left graph - date vs sub metering 1, 2 and 3
plot(hpcsub$Datetime, hpcsub$Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = "")
points(hpcsub$Datetime,hpcsub$Sub_metering_2, col = "red",  type = "l")
points(hpcsub$Datetime, hpcsub$Sub_metering_3, col = "blue", type = "l")
## Step 5.3.1: Make legend for graph in 5.3
legend("topright", pch = "______", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bty = "n")
## Step 5.4: Plot bottom right graph - date vs global reactive power
plot(hpcsub$Datetime, as.numeric(hpcsub$Global_reactive_power), type = "l", ylab = "Global_reactive_power", xlab = "Datetime")

## Step 6: Close the device
dev.off()