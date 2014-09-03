power <- read.table(dataWk1, sep = ";", header= TRUE, na.strings="?")
keepers <- grep( "^[1,2]\\/2\\/2007", power$Date)

sample <- power[keepers, ]
sample$Time1 <- strptime(paste(sample$Date, sample$Time),"%d/%m/%Y %H:%M:%OS")

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
