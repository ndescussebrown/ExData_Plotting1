plot1 <- function()
{
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

## create plot1.png and specifies the number of pixels  
  png(file = "plot1.png",width = 480, height = 480, units="px")
  
## plots the histogram of global active power for 1st Feb 2007 and 2nd Feb 2007  
  hist(householdpowerconsumption[,3],xlab="Global Active Power (kilowatts)",col=2,main="Global Active Power")
  dev.off()

  }