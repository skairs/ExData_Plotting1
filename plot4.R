## 04 June, 2014 -- SNK
## Coursera, Exploratory Data Analysis 
## Programming Assignment 1 - Plot 4

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

    ## to generate 2x2 grouping of plots - testing in on screen device
    ## par(mfrow = c(2,2))

    ##plot, topleft
    ## plot(datetime, feb_data$Global_active_power, type="l", ylab="Global Active Power", xlab="")

    ##plot, topright
    ## plot(datetime, feb_data$Voltage, type="l", ylab="Voltage")

    ##plot, bottomleft - fix legend
    ## plot(datetime, feb_data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
    ## points(datetime, feb_data$Sub_metering_1, type="l")
    ## points(datetime, feb_data$Sub_metering_2, type="l", col="red")
    ## points(datetime, feb_data$Sub_metering_3, type="l", col="blue")
    ## legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    ##        lty=1, col=c("black", "red", "blue"), bty="n")

    ##plot, bottomright
    ## plot(datetime, feb_data$Global_reactive_power, type="l", ylab="Global_reactive_power")

## to generate png file of plots:
png(filename = "plot4.png", width=480, height=480)
## group plots in 2 rows by 2 columns
par(mfrow = c(2,2))

##plot, topleft - no x-label
plot(datetime, feb_data$Global_active_power, type="l", ylab="Global Active Power", xlab="")

##plot, topright
plot(datetime, feb_data$Voltage, type="l", ylab="Voltage")

##plot, bottomleft - no boundary on legend, no x-label
plot(datetime, feb_data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
points(datetime, feb_data$Sub_metering_1, type="l")
points(datetime, feb_data$Sub_metering_2, type="l", col="red")
points(datetime, feb_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"), bty="n")

##plot, bottomright - underscores in y-label name
plot(datetime, feb_data$Global_reactive_power, type="l", ylab="Global_reactive_power")
dev.off()