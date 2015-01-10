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

#plotting
png(file="plot3.png")
x <- 1:length(data2$Date)
plot(x[1:3000],data2$Sub_metering_1[1:3000],type="n",xaxt="n",xlab="",ylab="Energy sub metering")
lines(x[1:3000],data2$Sub_metering_1[1:3000],type="l",xaxt="n",xlab="",ylab="Energy sub metering",col="black")
lines(x[1:3000],data2$Sub_metering_2[1:3000],type="l",xaxt="n",xlab="",ylab="Energy sub metering",col="red")
lines(x[1:3000],data2$Sub_metering_3[1:3000],type="l",xaxt="n",xlab="",ylab="Energy sub metering",col="blue")
legend("topright",cex=0.9,pt.cex=1,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
daylabels02 <- unique(weekdays(data2$Date,abbreviate=TRUE))
axis(1,at=dayindex,labels=daylabels02)
dev.off()
