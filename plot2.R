power <- read.table(dataWk1, sep = ";", header= TRUE, na.strings="?")
keepers <- grep( "^[1,2]\\/2\\/2007", power$Date)

sample <- power[keepers, ]
sample$Time1 <- strptime(paste(sample$Date, sample$Time),"%d/%m/%Y %H:%M:%OS")

png("Plot2.png")
par(lty=1, lwd = 1)
plot(sample$Time1, sample$Global_active_power, 
type="line",
ylab="Global Active Power (kilowatts)",
xlab="",
pch=""
)

dev.off()
