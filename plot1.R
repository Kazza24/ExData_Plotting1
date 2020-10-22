# Exploratory Data Analysis Week 1 Assignment - Plot 1

# Karin Kolbe, 21st October 2020. 

#Libraries
library(dplyr)  
library(lubridate)   

# clear out any old stuff
rm(list=ls())

# -- Set working directory
setwd("~/dataScience/4 ExploratoryDataAnalysis/RWork/Week1Assig")

filename <- "BigData.zip"

#download the file, unless already downloaded
if(!file.exists(filename)){
      fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      download.file(url = fileurl, destfile = filename, method = "curl")
}

#unzip the file , unless aready done 
if(!file.exists("household_power_consumption.txt")){
      unzip(filename)
}

allData <- read.csv2("household_power_consumption.txt",quote="'",dec=".",
      colClasses=c("character","character","numeric","numeric",
      "numeric","numeric","numeric","numeric","numeric"),
      na.strings = "?")

# Grab the required rows
myData <- allData %>%
      filter(Date=="1/2/2007" | Date=="2/2/2007")


#Plot 1
png(filename="plot1.png", width=480, height=480)
hist(myData$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",
      main="Global Active Power")
dev.off()
