# read dataset
epc_full <- read.csv(file="household_power_consumption.txt", sep=";", na.strings = "?" )

# convert variables
epc_full$Date <- as.Date(epc_full$Date, format="%d/%m/%Y")

# subset data
epc_selection <- epc_full$Date >= as.Date("2007-02-01") & epc_full$Date <= as.Date("2007-02-02") 

epc <- epc_full[epc_selection, ]


# set layout
par(mfrow=c(1,1))


## plot 2

epc$DateTime <- as.POSIXlt(paste( as.character(epc$Date), as.character(epc$Time)), format="%Y-%m-%d %H:%M:%S")

plot(epc$DateTime, epc$Global_active_power, xlab="", ylab= "Global Active Power (killowatts)", type="l")

# store as image of certain size: 480 x 480
png(filename="plot2.png")

plot(epc$DateTime, epc$Global_active_power, xlab="", ylab= "Global Active Power (killowatts)", type="l")

dev.off()
