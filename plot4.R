if(!file.exists("./ExData_Plotting1")) dir.create("./ExData_Plotting1")

##-----download and handle data-----##

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./Powerconsumption.zip")
listZip <- unzip("./Powerconsumption.zip", exdir = "./ExData_Plotting1")
setwd("./ExData_Plotting1")

alldata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header=TRUE, na.strings = "?", sep=";")
powerdata <- subset(alldata, Date=="1/2/2007" | Date=="2/2/2007")

##create a new column for Date/Time
powerdata$datetime <- paste(powerdata$Date, powerdata$Time, sep= " ")
Sys.setlocale("LC_TIME", "C") ##to make sure the times are interpreted OK 

##change datetime from character string to date/time type
powerdata$datetime <- strptime(powerdata$datetime, "%d/%m/%Y %H:%M:%S")

##-----create the graphs-----##

png(file="plot4.png", width=480, height=480)  ## launch png graphics device, and create the graphs:
par(mfcol=c(2,2)) ##setting the four graphic layout

##graph 1
with(powerdata, {
plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")

##graph 2
plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
  lines(datetime, Sub_metering_1, col="black")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), bty="n", cex=0.9, col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##graph 3
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

##graph 4
plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})

dev.off() ##close the graphics device
