## Step 1: Read in packages from the base
library(graphics)
library(grDevices)

## Step 2: Read in data and take only febuary 1 and 2, 2007. Also convert date/time variables to date/time class
hpc <- read.table(file = "household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hpcsub <- hpc[as.character(hpc$Date) %in% c("1/2/2007" , "2/2/2007"),]
hpcsub$Datetime <- strptime(paste(hpcsub$Date, hpcsub$Time), "%d/%m/%Y %H:%M:%S")

## Step 3: Start the PNG device
png(filename = "Plot1.png", width = 480, height = 480)

## Step 4: Make histogram for Global Active Power variable
hist(as.numeric(hpcsub$Global_active_power), main = "Global Active Power", col = "red", breaks = 13, xlab = "Global Active Power (Kilowatts)")

## Step 5: Close the device
dev.off()