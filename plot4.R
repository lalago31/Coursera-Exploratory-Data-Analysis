data <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData=data[data$Date %in% c('1/2/2007','2/2/2007'),]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subSetData$Global_active_power)
GRP <- as.numeric(subSetData$Global_reactive_power)
voltage<-as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#layout of plots
par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
#plot1
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power")
#plot2
plot(datetime, voltage, type="l", xlab="datetime", ylab="voltage")
#plot3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, lwd=2.5, col=c("black", "red", "blue"),bty="n",cex=0.75)
#plot4
plot(datetime, GAP, type="l", xlab="datetime", ylab="Global Reactive Power")
dev.copy(png, file="plot4.png", height=580, width=680)
dev.off()
