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
x1 <- transform(x,Date = as.Date(Date,"%d/%m/%Y"),Time = strptime(Time,"%X"))

#subset only data from 
x2 <- subset(x1, x1[,1] == "2007-02-01"| x1[,1]=="2007-02-02")


#Generate plot and save to repo folder as png
png("repo/plot1.png",width=480, height=480)
hist(as.numeric(as.character(x2$Global_active_power)),main="Global Active Power",xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", col = "red")

dev.off()
