# This program constructs the plot of the Global Active Power


setwd("~/R/Exploratory Data Analysis/Week_1/data")
# Load the dataset
datafile <- "household_power_consumption.txt"
power.cons <- read.csv(datafile,sep = ";",na.strings = "?")
pwrcs.subset <- power.cons[power.cons$Date %in% c("1/2/2007","2/2/2007"),]

# Construct the plot
# with "strptime" the Date and the Time variables are converted to Date/Time classes
DateTime <- strptime(paste(pwrcs.subset$Date,pwrcs.subset$Time,sep = " "),format="%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(pwrcs.subset$Global_active_power)
plot(DateTime,GlobalActivePower, type = "l",
     xlab = "",ylab = "Global Active Power (kilowatts)")

# Save the plot to a png-file
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()
