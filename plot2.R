data<-read.delim("household_power_consumption.txt",sep = ";")
mydata<-subset(data, Date=="1/2/2007"|Date=="2/2/2007")
dates<-paste(mydata$Date,mydata$Time)
dates<-strptime(dates, "%d/%m/%Y %H:%M:%S")
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
plot.new()
png("plot2.png",width = 480, height = 480)
plot(dates,mydata$Global_active_power,type = "n",
     ylab = "Global Active Power (kilowatts)", xlab ="")
lines(dates,mydata$Global_active_power, type="l")
dev.off()
