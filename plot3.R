plot3 <- function(x="")
{
  library(lubridate)
  ## connects to required input data and download file if not called by function plot4.R  
  if(x=="") {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,destfile="household_power_consumption.zip")
  rm(fileUrl)
  unzip("household_power_consumption.zip")
  
  ## selects suitable date range
  tempfile <- grep("1/2/2007", readLines("household_power_consumption.txt"))
  householdpowerconsumptionheader <- read.table("household_power_consumption.txt",header=TRUE,nrows=1,comment.char = "",sep=";")
  householdpowerconsumption <- read.table("household_power_consumption.txt",header=TRUE,skip=tempfile[1],nrows=2878,comment.char = "",sep=";")
  names(householdpowerconsumption) <- names(householdpowerconsumptionheader)
  
  ## merges date and time into one field to be used for plotting
  householddateandtime <- strptime(paste(householdpowerconsumption[,1],householdpowerconsumption[,2]),"%d/%m/%Y %H:%M:%S")
  }
  
  ## create plot3.png and specifies the number of pixels  
  if(x=="") {png(file = "plot3.png",width = 480, height = 480, units="px")}
  
  ## plots the histogram of global active power for 1st Feb 2007 and 2nd Feb 2007  
  with(householdpowerconsumption,plot(householddateandtime,householdpowerconsumption$Sub_metering_1,pch="",ylab="Energy sub metering",xlab=""))  
  lines(householddateandtime, householdpowerconsumption$Sub_metering_1, type = "l")
  with(householdpowerconsumption,points(householddateandtime,householdpowerconsumption$Sub_metering_2,pch="",ylab="",xlab=""))  
  lines(householddateandtime, householdpowerconsumption$Sub_metering_2, type = "l",col=2)  
  with(householdpowerconsumption,points(householddateandtime,householdpowerconsumption$Sub_metering_3,pch="",ylab="",xlab=""))  
  lines(householddateandtime, householdpowerconsumption$Sub_metering_3, type = "l",col=4) 
  if(x=="") {
  legend("topright",cex=1,col=c(1,2,4),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
  dev.off()}
  
}