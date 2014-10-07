# Coursera - Exploratory Data Analysis
# Peer Assessments - Course Project 1
# Date: Oct 2014
# Jaime Laoeden Ferrero
#
# Plot_2
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
# Convert Global Active Power from factor into numeric, as requried by hist
# Will also need to convert the factor levels into real factor values using the level function
temp_GAP <- as.numeric(levels(nrg_feb$Global_active_power)[nrg_feb$Global_active_power])
#
# Building Plot2, copying it into a graphic device png file, closing the graphic device png
plot(nrg_feb$Time,temp_GAP, type = "l", xlab = "", ylab="Global Active Power (kilowatts)", font.lab=6, font.axis=6)
dev.copy(png, file="plot2.png")
dev.off()

# Dropping temprary variables
rm(temp_GAP)
rm(filter)
