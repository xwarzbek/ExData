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
