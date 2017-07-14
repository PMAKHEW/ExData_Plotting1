##Set Working Directory
setwd("C:/Users/lp070/ExData_Plotting1")

##Load Household Power Consumption Data
household <- read.csv("C:/Users/lp070/ExData_Plotting1/Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char = "", quote='\"')
household$Date <- as.Date(household$Date, format="%d/%m/%Y")

##Subset Household Power Consumption Data
sub_household <- subset(household, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(household)

##Convert the dates in subset
datetime <- paste(as.Date(sub_household$Date), sub_household$Time)
sub_household$Datetime <- as.POSIXct(datetime)

##Create Plot1
hist(sub_household$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Save to PNG file
dev.copy(png, file="Plot1.png", height = 480, width = 480)
dev.off()