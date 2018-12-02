plot4 <- function()
{
  library(lubridate)
  source('C:/Users/natha/ExData_Plotting1/plot3.R')
  
  ## connects to required input data and download file  
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
  
  ## create plot4.png and specifies the number of pixels  
  png(file = "plot4.png",width = 480, height = 480, units="px")
  
  ## plots the histogram of global active power for 1st Feb 2007 and 2nd Feb 2007  
  par(mfrow=c(2,2))
  with(householdpowerconsumption, {
  plot(householddateandtime,householdpowerconsumption$Global_active_power,pch= ".",ylab="Global Active Power",xlab="")  
  lines(householddateandtime, householdpowerconsumption$Global_active_power, type = "l")
  plot(householddateandtime,householdpowerconsumption$Voltage,pch=".",ylab="Voltage",xlab="datetime")  
  lines(householddateandtime, householdpowerconsumption$Voltage, type = "l")  
  plot3(0) 
  legend("topright",bty="n",cex=1,col=c(1,2,4),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
  plot(householddateandtime,householdpowerconsumption$Global_reactive_power,pch=".",ylab="Global_reactive_power",xlab="datetime") 
  lines(householddateandtime, householdpowerconsumption$Global_reactive_power, type = "l") 
  })
  dev.off()
  
}