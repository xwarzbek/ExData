power <- read.table(dataWk1, sep = ";", header= TRUE, na.strings="?")
keepers <- grep( "^[1,2]\\/2\\/2007", power$Date)

sample <- power[keepers, ]
sample$Time1 <- strptime(paste(sample$Date, sample$Time),"%d/%m/%Y %H:%M:%OS")

png("Plot1.png")
hist(as.numeric(sample$Global_active_power),
#breaks=25,
main="Global Active Power",
xlab="Global Active Power (kilowatts)", 
col="red",
xlim=c(0,6)
)
dev.off()

png("Plot2.png")
par(lty=1, lwd = 1)
plot(sample$Time1, sample$Global_active_power, 
type="line",
ylab="Global Active Power (kilowatts)",
xlab="",
pch=""
)

dev.off()

png("Plot3.png")
plot(sample$Time1, sample$Sub_metering_1,
     type="line",
     col="black",
     xlab="",
     ylab="Energy sub metering")
lines(sample$Time1,sample$Sub_metering_2, col="red")
lines(sample$Time1,sample$Sub_metering_3, col="blue")

legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3")
       )

dev.off()

png("Plot4.png")
par(mfrow=c(2,2))
plot(sample$Time1, sample$Global_active_power, 
     type="line",
     ylab="Global Active Power",
     xlab="",
     pch=""
)
plot(sample$Time1, sample$Voltage, 
     type="line",
     ylab="Voltage",
     xlab="datetime",
     pch=""
)

plot(sample$Time1, sample$Sub_metering_1,
     type="line",
     col="black",
     xlab="",
     ylab="Energy sub metering")
lines(sample$Time1,sample$Sub_metering_2, col="red")
lines(sample$Time1,sample$Sub_metering_3, col="blue")

legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3")
)

plot(sample$Time1, sample$Global_reactive_power, 
     type="line",
     ylab="Global reactive power",
     xlab="datetime",
     pch=""
)
dev.off()
par(mfrow=c(1, 1))