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
x <- 1:length(data2$Date)
plot(x[1:3000],data2$Global_active_power[1:3000],type="n",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
plot(x[1:3000],data2$Global_active_power[1:3000],type="l",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
daylabels02 <- unique(weekdays(data2$Date,abbreviate=TRUE))
axis(1,at=dayindex,labels=daylabels02)
dev.copy(png,file="plot2.png")
dev.off()
