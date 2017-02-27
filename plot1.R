# This program constructs a histogram of the Global Active Power

# Download and unzip the dataset
setwd("~/R/Exploratory Data Analysis/Week_1")
if (!file.exists("data")) dir.create("data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/household_power_consumption.zip")
unzip( "./data/household_power_consumption.zip", exdir = "data")

setwd("~/R/Exploratory Data Analysis/Week_1/data")
# Load the dataset
datafile <- "household_power_consumption.txt"
power.cons <- read.csv(datafile,sep = ";",na.strings = "?")
pwrcs.subset <- power.cons[power.cons$Date %in% c("1/2/2007","2/2/2007"),]

# Plot the histogram
GlobalActivePower <- as.numeric(pwrcs.subset$Global_active_power)
hist(GlobalActivePower, col = "red",main="Global Active Power",xlab = "Global Active Power (kilowatts)",plot = TRUE)

# Save the plot to a png-file
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()
