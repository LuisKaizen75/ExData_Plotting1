data<-read.delim("household_power_consumption.txt",sep = ";")
mydata<-subset(data, Date=="1/2/2007"|Date=="2/2/2007")
dates<-paste(mydata$Date,mydata$Time)
dates<-strptime(dates, "%d/%m/%Y %H:%M:%S")
mydata$Voltage<-as.numeric(mydata$Voltage)
sm1<-mydata$Sub_metering_1<-as.numeric(mydata$Sub_metering_1)
sm2<-mydata$Sub_metering_2<-as.numeric(mydata$Sub_metering_2)
sm3<-mydata$Sub_metering_3<-as.numeric(mydata$Sub_metering_3)

plot.new()

png("plot4.png",width = 480, height = 480)
par(mfcol=c(2,2))

plot(dates,mydata$Global_active_power,type = "n",
     ylab = "Global Active Power (kilowatts)", xlab ="")
lines(dates,mydata$Global_active_power, type="l")


plot(dates,sm1,type = "n",ylab = "Energy sub metering", xlab ="")
lines(dates,sm1, type="l",col="black")
lines(dates,sm2, type = "l", col="red")
lines(dates,sm3, type = "l", col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty =c(1,1,1), bty = "n")

plot(dates,mydata$Voltage,type = "n",
     ylab = "Voltage", xlab ="datetime")
lines(dates,mydata$Voltage, type="l")

plot(dates,mydata$Global_reactive_power,type = "n",
     ylab = "Global_reactive_power", xlab ="datetime")
lines(dates,mydata$Global_reactive_power, type="l")

dev.off()

