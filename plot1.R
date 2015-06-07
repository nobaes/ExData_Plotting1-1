setwd("F:/R")

df <- read.table("household_power_consumption.txt", header = T, sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
#head(df)

dataplott <- subset(df,df$Date=="1/2/2007" | df$Date=="2/2/2007")
#head(dataplott)
#unique(dataplott$Date)

library(datasets)


##plot1######################################
png(filename = "plot1.png",width=480,height=480,units ="px")

with(dataplott, hist(Global_active_power,main = c("Global Active Power"),
xlab=c("Global Acive Power (kilowatts)"),col=c("red")))

dev.off()
