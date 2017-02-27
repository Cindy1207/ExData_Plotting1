# This program constructs the plot of the Energy sub metering


setwd("~/R/Exploratory Data Analysis/Week_1/data")
# Load the dataset
datafile <- "household_power_consumption.txt"
power.cons <- read.csv(datafile,sep = ";",na.strings = "?")
pwrcs.subset <- power.cons[power.cons$Date %in% c("1/2/2007","2/2/2007"),]

# Construct the plot and save the plot to png-file "plot3.png"
DateTime <- strptime(paste(pwrcs.subset$Date,pwrcs.subset$Time,sep = " "),format="%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(pwrcs.subset$Global_active_power)
SubMetering1 <- as.numeric(pwrcs.subset$Sub_metering_1)
SubMetering2 <- as.numeric(pwrcs.subset$Sub_metering_2)
SubMetering3 <- as.numeric(pwrcs.subset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(DateTime,SubMetering1, type = "l",
     xlab = "",ylab = "Energy sub metering")
lines(DateTime,SubMetering2,type = "l",col="red")
lines(DateTime,SubMetering3,type = "l",col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=1.5,col=c("black", "red", "blue"))

dev.off()
