# read dataset
epc_full <- read.csv(file="household_power_consumption.txt", sep=";", na.strings = "?" )

# convert variables
epc_full$Date <- as.Date(epc_full$Date, format="%d/%m/%Y")

# subset data
epc_selection <- epc_full$Date >= as.Date("2007-02-01") & epc_full$Date <= as.Date("2007-02-02") 

epc <- epc_full[epc_selection, ]

# set layout
par(mfrow=c(1,1))

hist( epc$Global_active_power, 
      xlab = "Global Active Power (kilowatts)", 
      main= "Global Active Power", 
      col="red" )

# store as image of certain size: 480 x 480
png(filename="plot1.png")

hist( epc$Global_active_power, 
      xlab = "Global Active Power (kilowatts)", 
      main= "Global Active Power", 
      col="red" )
dev.off()

