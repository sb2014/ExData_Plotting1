dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
subDat <- subset(dat, dat$Date == "2007-02-01" | dat$Date =="2007-02-02")
library(datasets)
hist(as.numeric(as.character(subDat$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red", ylim=c(0,1200))

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px") ## Copy my plot to a PNG file 
dev.off()