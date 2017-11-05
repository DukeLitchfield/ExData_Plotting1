

#download source data & unzip in directory

urll<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#destination zip
destfile<-paste0(getwd(),"/","dataweek1.zip")
#download zip file
download.file(urll,destfile)
#unzip file
unzip("dataweek1.zip")

#open file
x <- read.table("household_power_consumption.txt",header=T,sep = ";")

library(lubridate)

#convert date and time to char so they can generate datetime col
x1 <- transform(x,Date = as.character(Date),Time = as.character(Time))

#subset only data from 2/1/07 & 2/2/07
x2 <- subset(x1, x1[,1] == "1/2/2007"| x1[,1]=="2/2/2007")

#generate Date/Time coumn 
x2$datetime<- dmy_hms(paste(x2$Date,x2$Time))

dev.off()
png("repo/plot4.png",width=480, height=480)
#Generate plot and save to repo folder as png
#png("repo/plot4.png",width=480, height=480)

#generate 2x2 chart
par(mfrow=c(2,2))


#generate plot 1
plot(x2$datetime,as.numeric(as.character(x2$Global_active_power)),
     ylab = "Global Active Power (kilowatt)",xlab ="",
     type="l")

#generate plot 2

plot(x2$datetime,as.numeric(as.character(x2$Voltage)),
     ylab = "Voltage",xlab ="datetime",
     type="l")

#generate plot 3

plot(x2$datetime,as.numeric(as.character(x2$Sub_metering_1)),
     ylab = "Energy sub metering)",xlab ="",
     type="l")

lines(x2$datetime,as.numeric(as.character(x2$Sub_metering_2)),
      col = "red")

lines(x2$datetime,as.numeric(as.character(x2$Sub_metering_3)),
      col = "blue")

legend("topright", legend=c("Sub metering 1","Sub metering 2","Sub metering 3"), col = c("black","red","blue"),lty = 1)

#generate plot 4

plot(x2$datetime,as.numeric(as.character(x2$Global_reactive_power)),
     ylab = "global_reactive power",xlab ="datetime",
     type="l")

dev.off()
