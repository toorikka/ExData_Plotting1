if(!file.exists("./ExData_Plotting1")) dir.create("./ExData_Plotting1")

##-----download and handle data-----##

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./Powerconsumption.zip")
listZip <- unzip("./Powerconsumption.zip", exdir = "./ExData_Plotting1")
setwd("./ExData_Plotting1")

alldata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header=TRUE, na.strings = "?", sep=";")
powerdata <- subset(alldata, Date=="1/2/2007" | Date=="2/2/2007")

##-----create the graph-----##

png(file="plot1.png", width=480, height=480)  ## launch png graphics device, and create the graph:
par(mfrow = c(1,1)) ## check the graphics environment is ok for this graph

hist(powerdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off() ##close the graphics device




