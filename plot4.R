setwd("F:/R")

df <- read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
dataplott <- subset(df,df$Date=="1/2/2007" | df$Date=="2/2/2007")
#head(dataplott)
library(datasets)

##plot4####################
png(filename = "plot4.png",width=480,height=480,units ="px")

x <- with(dataplott,paste(Date,Time))
x_axs_value <- strptime(x, "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

##Replace label of Weekday (KOR --> ENG)
x_axs_day <- format(seq.Date(as.Date('2007-02-01'), by = 'day', len=3), "%Y-%m-%d")
x_axs_at <- paste(x_axs_day,"00:00:00")
x_axs <- as.numeric(strptime(x_axs_at, "%Y-%m-%d %H:%M:%S"))

plot(x_axs_value,dataplott$Global_active_power,type="l",ylab="Global Active Power", xaxt="n", xlab="")
axis(side=1, at=c(x_axs), labels=c("Thu","Fri","Sat"))

plot(x_axs_value,dataplott$Voltage,type="l",ylab="Voltage", xaxt="n", xlab="datetime")
axis(side=1, at=c(x_axs), labels=c("Thu","Fri","Sat"))

plot(x_axs_value,dataplott$Sub_metering_1,type="l",ylab="Energy sub metering", xaxt="n",xlab="")
lines(x_axs_value,dataplott$Sub_metering_2,col="red")
lines(x_axs_value,dataplott$Sub_metering_3,col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
col=c("black","red","blue"),lty=c(1,1,1),bty="n")
axis(side=1, at=c(x_axs), labels=c("Thu","Fri","Sat"))

plot(x_axs_value,dataplott$Global_reactive_power,type="l",ylab="Global_reactive_power", xaxt="n", xlab="datetime")
axis(side=1, at=c(x_axs), labels=c("Thu","Fri","Sat"))

dev.off()
