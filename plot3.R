# Exploratory Data Analysis Week 1 Assignment - Plot 3

# Karin Kolbe, 21st October 2020. 

#Libraries
#library(dplyr)  
#library(lubridate)   

#File is downloaded and unzipped by plot 1
allData <- read.csv2("household_power_consumption.txt",quote="'",dec=".",
                     colClasses=c("character","character","numeric","numeric",
                                  "numeric","numeric","numeric","numeric","numeric"),
                     na.strings = "?")

# Grab the required rows
myData <- allData %>%
      filter(Date=="1/2/2007" | Date=="2/2/2007")


#Combine the date & time into one column
myData$DateTimect <- as.POSIXct(strptime(paste(myData$Date,myData$Time), 
                                         "%d/%m/%Y %H:%M:%S"))

#plot it, colour by colour
png(filename="plot3.png", width=480, height=480)
with(myData,plot(DateTimect,Sub_metering_1,type="l",
                 ylab="Energy sub metering", xlab=""))
with(myData,lines(DateTimect,Sub_metering_2,col="red"))
with(myData,lines(DateTimect,Sub_metering_3,col="blue"))


legend("topright",lwd=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

