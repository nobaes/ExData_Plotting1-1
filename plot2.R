setwd("F:/R")

df <- read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
#head(df)

dataplott <- subset(df,df$Date=="1/2/2007" | df$Date=="2/2/2007")
#head(dataplott)
#unique(dataplott$Date)

library(datasets)

##plot2####################
png(filename = "plot2.png",width=480,height=480,units ="px")

x <- with(dataplott,paste(Date,Time))
x_axs_value <- strptime(x, "%d/%m/%Y %H:%M:%S")

plot(x_axs_value,dataplott$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xaxt="n", xlab="")
##Replace label of Weekday (KOR --> ENG)
x_axs_day <- format(seq.Date(as.Date('2007-02-01'), by = 'day', len=3), "%Y-%m-%d")
x_axs_at <- paste(x_axs_day,"00:00:00")
x_axs <- as.numeric(strptime(x_axs_at, "%Y-%m-%d %H:%M:%S"))
axis(side=1, at=c(x_axs), labels=c("Thu","Fri","Sat"))

dev.off()
