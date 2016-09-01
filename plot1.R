plot1 <- function(){
  library(lubridate)
  consumption <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";",header=TRUE)
  consumption_two_dates <- consumption[ !is.na(consumption$Date) & consumption$Date != "?" & consumption$Date != "" & (dmy(consumption$Date)==ymd("2007-02-01") | dmy(consumption$Date)==ymd("2007-02-02")),]
  
  png("plot1.png")
  hist(as.numeric( consumption_two_dates$Global_active_power),main = "Global Active Power", xlab= "Global Active Power (kilowatts)", col = "red")
  dev.off()
  
}