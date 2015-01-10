#load data
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")
data2 <- subset(data,as.Date(data$Date,"%d/%m/%Y")>="2007-02-01" & as.Date(data$Date,"%d/%m/%Y")<="2007-02-03")
data2$Date <- as.Date(data2$Date,"%d/%m/%Y")


#generating axis labels and indexes
daylabelA <- unique(weekdays(data2$Date))
print(daylabelA)
dayindex <- 1
for (i in 1:length(data2$Date)){
        if (weekdays(data2$Date[i])==daylabelA[2]){
                dayindex[2] <- i
                break
        } 
}
for (i in 1:length(data2$Date)){
        if (weekdays(data2$Date[i])==daylabelA[3]){
                dayindex[3] <- i
                break
        } 
}
print(dayindex)

x <- 1:length(data2$Date)
daylabels02 <- unique(weekdays(data2$Date,abbreviate=TRUE))


png(file="plot4.png",width=480,height=480)
par(mfrow = c(2, 2))
#par(cex=1.5)
par(mar = c(4, 4, 0.5, 0.5), oma = c(1.5, 2, 1, 1))
for (i in 1:4) {
        #plot1
        {
                plot(x[1:3000],data2$Global_active_power[1:3000],type="n",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
                lines(x[1:3000],data2$Global_active_power[1:3000],type="l",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
                axis(1,at=dayindex,labels=daylabels02)
        }
        #plot2
        {
                plot(x[1:3000],data2$Voltage[1:3000],type="n",xaxt="n",xlab="daytime",ylab="Voltage")
                lines(x[1:3000],data2$Voltage[1:3000],type="l",xaxt="n",xlab="daytime",ylab="Voltage")
                axis(1,at=dayindex,labels=daylabels02)
        }
        #plot3
        {
                plot(x[1:3000],data2$Sub_metering_1[1:3000],type="n",xaxt="n",xlab="",ylab="Energy sub metering")
                lines(x[1:3000],data2$Sub_metering_1[1:3000],type="l",xaxt="n",xlab="",ylab="Energy sub metering",col="black")
                lines(x[1:3000],data2$Sub_metering_2[1:3000],type="l",xaxt="n",xlab="",ylab="Energy sub metering",col="red")
                lines(x[1:3000],data2$Sub_metering_3[1:3000],type="l",xaxt="n",xlab="",ylab="Energy sub metering",col="blue")
                legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty="n",lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
                axis(1,at=dayindex,labels=daylabels02)
        }

        #plot4
        {
                plot(x[1:3000],data2$Global_reactive_power[1:3000],type="n",xaxt="n",xlab="daytime",ylab="Global_reactive_power")
                lines(x[1:3000],data2$Global_reactive_power[1:3000],type="l",xaxt="n",xlab="daytime",ylab="Global_reactive_power")
                axis(1,at=dayindex,labels=daylabels02)
        }

}
dev.off()

