# Coursera - Exploratory Data Analysis
# Peer Assessments - Course Project 1
# Date: Oct 2014
# Jaime Laoeden Ferrero
#
# Plot_4
#
# Do not forget to set up yopur right Working directory
# setwd("D:/userdata/jlaorde1/Desktop/Data Mining/EDX & Coursera training/Exploratory Data Analysis/Course Project 1")
#
# Read file
nrg <- read.csv("household_power_consumption.txt", sep = ";")
#
# Subset on days we want to use
filter <- nrg$Date == "1/2/2007" | nrg$Date == "2/2/2007"
nrg_feb <- subset(nrg, filter)
#
# Adjust new factors levels
nrg_feb <- droplevels(nrg_feb)
#
# Convert Date and Time attributes from factor into date and time format
nrg_feb$Time <- strptime(paste(nrg_feb$Date, nrg_feb$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
nrg_feb$Date <- as.Date(nrg_feb$Date, "%d/%m/%Y")
#
# Convert Sub_metering_x from factor into numeric, as requried by hist
# Will also need to convert the factor levels into real factor values using the level function
temp_GAP <- as.numeric(levels(nrg_feb$Global_active_power)[nrg_feb$Global_active_power])
temp_VOL <- as.numeric(levels(nrg_feb$Voltage)[nrg_feb$Voltage])
temp_GRP <- as.numeric(levels(nrg_feb$Global_reactive_power)[nrg_feb$Global_reactive_power])
temp_SM1 <- as.numeric(levels(nrg_feb$Sub_metering_1)[nrg_feb$Sub_metering_1])
temp_SM2 <- as.numeric(levels(nrg_feb$Sub_metering_2)[nrg_feb$Sub_metering_2])
temp_SM3 <- as.numeric(nrg_feb$Sub_metering_3)
#
# Building Plot4, copying it into a graphic device png file, closing the graphic device png
# Setting up 4 frame graphics framework, with the right margins
par(mar=c(4,4,2,1))
par(mfrow=c(2,2))
# plotting first graph
plot(nrg_feb$Time,temp_GAP, type = "l", xlab = "", ylab="Global Active Power",  font.lab=6, font.axis=6)
# plotting second graph
plot(nrg_feb$Time,temp_VOL, type = "l", xlab = "datetime", ylab="Voltage",  font.lab=6, font.axis=6)
# plotting third graph
plot(nrg_feb$Time, temp_SM1, type ="l", xlab = "", ylab="Energy sub metering",  font.lab=6, font.axis=6)
points(nrg_feb$Time, temp_SM2, type ="l", col = "red")
points(nrg_feb$Time, temp_SM3, type ="l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty  =1, text.font=6)
# plotting fourth graph
plot(nrg_feb$Time,temp_GRP, type = "l", xlab = "datetime", ylab="Global reactive power", font.axis=6)

dev.copy(png, file="plot4.png")
dev.off()

# Dropping temprary variables
rm(temp_GAP)
rm(filter)
rm(temp_VOL)
rm(temp_GRP)
rm(temp_SM1)
rm(temp_SM2)
rm(temp_SM3)
