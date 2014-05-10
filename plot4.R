dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
subDat <- subset(dat, dat$Date == "2007-02-01" | dat$Date =="2007-02-02")

library(datasets)
par(mfrow = c(2, 2), mar = c(4, 5, 2, 1), oma = c(0, 0, 2, 0))
with (subDat, {
    plot(as.POSIXct(paste(subDat$Date, subDat$Time), format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(subDat$Global_active_power)), ylab="Global Active Power", xlab="", type="l")
    plot(as.POSIXct(paste(subDat$Date, subDat$Time), format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(subDat$Voltage)), ylab="Voltage", xlab="datetime", type="l")
    plot(as.POSIXct(paste(subDat$Date, subDat$Time), format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(subDat$Sub_metering_1)), ylab="Energy sub metering", xlab="", type="l")
    lines(as.POSIXct(paste(subDat$Date, subDat$Time), format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(subDat$Sub_metering_2)), type="l", col="red")
    lines(as.POSIXct(paste(subDat$Date, subDat$Time), format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(subDat$Sub_metering_3)), type="l", col="blue")
    legend("topright", lty=1, , bty="n", col=c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.font=1,cex=0.6)
    plot(as.POSIXct(paste(subDat$Date, subDat$Time), format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(subDat$Global_reactive_power)), ylab="Global_reactive_power", xlab="datetime", type="l")
     })
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px", res=60) ## Copy my plot to a PNG file 
par(mar=c(4,3,2,2)+0.1)
dev.off()