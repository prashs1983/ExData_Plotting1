plot2 <- function(){
  library(lubridate)
  consumption <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";",header=TRUE)
  consumption_two_dates <- consumption[ !is.na(consumption$Date) & consumption$Date != "?" & consumption$Date != "" & (dmy(consumption$Date)==ymd("2007-02-01") | dmy(consumption$Date)==ymd("2007-02-02")),]
  
  png("plot2.png")
  plot(dmy_hms(paste(consumption_two_dates$Date,consumption_two_dates$Time)),consumption_two_dates$Global_active_power, type = "l", xlab="", ylab="Global Active Power (killowatts)")
  dev.off()
  
}