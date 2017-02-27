# This program constructs multiple base plots (4)


setwd("~/R/Exploratory Data Analysis/Week_1/data")
# Load the dataset
datafile <- "household_power_consumption.txt"
power.cons <- read.csv(datafile,sep = ";",na.strings = "?")
pwrcs.subset <- power.cons[power.cons$Date %in% c("1/2/2007","2/2/2007"),]

# Construct the 4 plots and save the plot to png-file "plot4.png"
DateTime <- strptime(paste(pwrcs.subset$Date,pwrcs.subset$Time,sep = " "),format="%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(pwrcs.subset$Global_active_power)
GlobalReactivePower <- as.numeric(pwrcs.subset$Global_reactive_power)
Voltage <- as.numeric(pwrcs.subset$Voltage)
SubMetering1 <- as.numeric(pwrcs.subset$Sub_metering_1)
SubMetering2 <- as.numeric(pwrcs.subset$Sub_metering_2)
SubMetering3 <- as.numeric(pwrcs.subset$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
# plot topleft:
plot(DateTime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power")
# plot topright:
plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# plot left under:
plot(DateTime,SubMetering1, type = "l",
     xlab = "",ylab = "Energy sub metering")
lines(DateTime,SubMetering2,type = "l",col="red")
lines(DateTime,SubMetering3,type = "l",col="blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=1.5,col=c("black", "red", "blue"),bty = "n")
# plot right under:
plot(DateTime, GlobalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
