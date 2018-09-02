p3<-read.csv("household_power_consumption.txt",sep = ";",header=TRUE,na.strings = "?")
p3$Date=as.Date(p3$Date,format="%d/%m/%Y")

p3a<-subset(p3,subset=( Date >="2007-02-01" & Date <="2007-02-02"))

p3b<-paste(as.Date(p3a$Date),p3a$Time)
p3a$DateTime<- as.POSIXct(p3b)

with(p3a, {
  plot(
    Sub_metering_1~DateTime,type="l",
       ylab="Global Active Power (kilowatts)",xlab="")
  lines(Sub_metering_2~DateTime,col="Red")
  lines(Sub_metering_3~DateTime,col="Blue
")  
     
})

legend("topright", col=c("black","red","blue"),lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="./Users/pawan/Documents/plot3.png",height=480,width=480)
dev.off()
