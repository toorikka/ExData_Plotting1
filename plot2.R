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

##-----create the graph-----##

png(file="plot2.png", width=480, height=480)  ## launch png graphics device, and create the graph:
par(mfrow = c(1,1)) ## check the graphics environment is ok for this graph

plot(powerdata$datetime, powerdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() ##close the graphics device

