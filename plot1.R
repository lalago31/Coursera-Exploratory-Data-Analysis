data <- read.table('household_power_consumption.txt', header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset=data[data$Date %in% c('1/2/2007','2/2/2007'),]
GAP=as.numeric(subset$Global_active_power)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
