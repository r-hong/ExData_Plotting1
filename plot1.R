data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
data2 <- subset(data,as.Date(data$Date,"%d/%m/%Y")>="2007-02-01" & as.Date(data$Date,"%d/%m/%Y")<="2007-02-02")
hist(data2$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.copy(png,file="plot1.png")
dev.off()
