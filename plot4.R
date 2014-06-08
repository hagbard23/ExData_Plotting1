# read dataset
epc_full <- read.csv(file="household_power_consumption.txt", sep=";", na.strings = "?" )

# convert variables
epc_full$Date <- as.Date(epc_full$Date, format="%d/%m/%Y")

# subset data
epc_selection <- epc_full$Date >= as.Date("2007-02-01") & epc_full$Date <= as.Date("2007-02-02") 

epc <- epc_full[epc_selection, ]

epc$DateTime <- as.POSIXlt(paste( as.character(epc$Date), as.character(epc$Time)), format="%Y-%m-%d %H:%M:%S")

# set layout
par(mfrow=c(2,2))

# plot1
plot(epc$DateTime, epc$Global_active_power, xlab="", ylab= "Global Active Power", type="l")

# plot2
plot(epc$DateTime, epc$Voltage, xlab="datetime", ylab= "Voltage", type="l")

# plot 3
plot(epc$DateTime, epc$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(epc$DateTime, epc$Sub_metering_2, col="red")
lines(epc$DateTime, epc$Sub_metering_3, col="blue")
legend("topright", legend=names(epc[7:9]), col=c("black", "red", "blue"), lty=c(1,1), bty = "n")

# plot 4

with(epc, plot(DateTime, Global_reactive_power, xlab="datetime", type="l") )




# store as image of certain size: 480 x 480
png(filename="plot4.png")

# set layout
par(mfrow=c(2,2))

# plot1
plot(epc$DateTime, epc$Global_active_power, xlab="", ylab= "Global Active Power", type="l")

# plot2
plot(epc$DateTime, epc$Voltage, xlab="datetime", ylab= "Voltage", type="l")

# plot 3
plot(epc$DateTime, epc$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(epc$DateTime, epc$Sub_metering_2, col="red")
lines(epc$DateTime, epc$Sub_metering_3, col="blue")
legend("topright", legend=names(epc[7:9]), col=c("black", "red", "blue"), lty=c(1,1), bty = "n")

# plot 4

with(epc, plot(DateTime, Global_reactive_power, xlab="datetime", type="l") )

dev.off()

