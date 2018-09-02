p2<-read.csv("household_power_consumption.txt",sep = ";",header=TRUE,na.strings = "?")
p2$Date=as.Date(p2$Date,format="%d/%m/%Y")

p2a<-subset(p2,subset=( Date >="2007-02-01" & Date <="2007-02-02"))

p2b<-paste(as.Date(p2a$Date),p2a$Time)
p2a$DateTime<- as.POSIXct(p2b)

plot(p2a$Global_active_power~p2a$DateTime,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,file="./Users/pawan/Documents/plot2.png",height=480,width=480)
dev.off()

