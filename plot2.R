# Exploratory Data Analysis Week 1 Assignment - Plot 2

# Karin Kolbe, 21st October 2020. 

#Libraries
#library(dplyr)  
#library(lubridate)    # done in plot1

#Files is downloaded and unzipped by plot 1


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

#plot it
png(filename="plot2.png", width=480, height=480)
with(myData,plot(DateTimect,Global_active_power,type="l",
                    ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()



