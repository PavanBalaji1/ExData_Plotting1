p1<-read.csv("household_power_consumption.txt",sep = ";",header=TRUE,na.strings = "?")
p1$Date=as.Date(p1$Date,format="%d/%m/%Y")

p1a<-subset(p1,subset=( Date >="2007-02-01" & Date <="2007-02-02"))

p1b<-paste(as.Date(p1a$Date),p1a$Time)
p1a$DateTime<- as.POSIXct(p1b)

hist(p1a$Global_active_power,main = "Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="Red")

x<-getwd()
y<-paste0(x,"/plot1.png")
dev.copy(png,file="y",height=480,width=480)
dev.off
