## 02 June, 2014 -- SNK
## Coursera, Exploratory Data Analysis 
## Programming Assignment 1 - Plot 1

## data file name:
filename <- "household_power_consumption.txt"

## read in data file. Note: separator is semi-colon
data <- read.csv(filename, header = TRUE, sep = ";", na.strings="?")

## convert dates to %Y-%m-%d format from %d/%m/%Y format
data[,1] <- as.Date(data[,1], format="%d/%m/%Y")

## create a data filter:
filter <- c("2007-02-01", "2007-02-02")

## subset by requested date range:
feb_data <- data[((data[,1]==filter[1]) | (data[,1]==filter[2])),]

## to generate plot
hist(feb_data[,3], col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

## to generate png file of plot:
png(filename = "plot1.png", width=480, height=480)
hist(feb_data[,3], col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()