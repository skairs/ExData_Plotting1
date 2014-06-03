## 03 June, 2014 -- SNK
## Coursera, Exploratory Data Analysis 
## Programming Assignment 1 - Plot 2

## data file name:
filename <- "household_power_consumption.txt"

## read in data file. Note: separator is semi-colon
data <- read.csv(filename, header = TRUE, sep = ";", na.strings="?")

## convert dates to %Y-%m-%d format from %d/%m/%Y format
data[,1] <- as.Date(data[,1], format="%d/%m/%Y")

## create a data filter:
filter <- c("2007-02-01", "2007-02-02")

## subset by requested date range (Feb 1 or Feb 2, 2007):
feb_data <- data[((data[,1]==filter[1]) | (data[,1]==filter[2])),]

## merge date & time information into new vector & convert to R time
datetime <- paste(as.character(feb_data[,1]), feb_data[,2], sep = " ")
datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

## to generate plot
plot(datetime, feb_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## to generate png file of plot:
png(filename = "plot2.png", width=480, height=480)
plot(datetime, feb_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()