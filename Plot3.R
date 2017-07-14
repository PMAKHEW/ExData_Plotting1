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

##Create Plot3
with(sub_household, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col="red")
  lines(Sub_metering_3~Datetime, col="blue")
})

##Create the legenda
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Save to PNG file
dev.copy(png, file="Plot3.png", height = 480, width = 480)
dev.off()