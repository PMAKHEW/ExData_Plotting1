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

##Create Plot4
par(mfrow=c(2,2))
plot(sub_household$Datetime, sub_household$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(sub_household$Datetime,sub_household$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(sub_household$Datetime,sub_household$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sub_household$Datetime,sub_household$Sub_metering_2,col="red")
lines(sub_household$Datetime,sub_household$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5)
plot(sub_household$Datetime, sub_household$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

##Save to PNG file
dev.copy(png, file="Plot4.png", height = 480, width = 480)
dev.off()