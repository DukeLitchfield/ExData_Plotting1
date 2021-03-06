library(lubridate)

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

#convert Date column to date format
x1 <- transform(x,Date = as.character(Date),Time = as.character(Time))
#test <- transform(x,Date = as.Date(Date,"%d/%m/%Y"))

#subset only data from 2/1/07 & 2/2/07
x2 <- subset(x1, x1[,1] == "1/2/2007"| x1[,1]=="2/2/2007")

#generate Date/Time coumn 
x2$datetime<- dmy_hms(paste(x2$Date,x2$Time))


#Generate plot and save to repo folder as png
png("repo/plot2.png",width=480, height=480)
plot(x2$datetime,as.numeric(as.character(x2$Global_active_power)),
     ylab = "Global Active Power (kilowatt)",xlab ="",
     type="l")

dev.off()
