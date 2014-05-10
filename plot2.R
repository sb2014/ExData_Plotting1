dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
subDat <- subset(dat, dat$Date == "2007-02-01" | dat$Date =="2007-02-02")
plot(as.POSIXct(paste(subDat$Date, subDat$Time), format="%Y-%m-%d %H:%M:%S"), as.numeric(as.character(subDat$Global_active_power)), ylab="Global Active Power (kilowatts)", xlab="", type="l")

dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px") ## Copy my plot to a PNG file 
dev.off()