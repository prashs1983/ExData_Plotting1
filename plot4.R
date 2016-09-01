plot4 <- function(){
  library(lubridate)
  consumption <- read.table("household_power_consumption.txt",stringsAsFactors=FALSE,sep=";",header=TRUE)
  consumption_two_dates <- consumption[ !is.na(consumption$Date) & consumption$Date != "?" & consumption$Date != "" & (dmy(consumption$Date)==ymd("2007-02-01") | dmy(consumption$Date)==ymd("2007-02-02")),]
  
  png("plot4.png")
  par(mfrow = c(2, 2))
  plot(dmy_hms(paste(consumption_two_dates$Date,consumption_two_dates$Time)),consumption_two_dates$Global_active_power, type = "l", xlab="", ylab="Global Active Power (killowatts)")
  plot(dmy_hms(paste(consumption_two_dates$Date,consumption_two_dates$Time)),consumption_two_dates$Voltage, type = "l", xlab="datetime", ylab="Voltage")
  
  
  plot(dmy_hms(paste(consumption_two_dates$Date,consumption_two_dates$Time)),consumption_two_dates$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
  lines(dmy_hms(paste(consumption_two_dates$Date,consumption_two_dates$Time)),consumption_two_dates$Sub_metering_3, col= "blue")
  lines(dmy_hms(paste(consumption_two_dates$Date,consumption_two_dates$Time)),consumption_two_dates$Sub_metering_2, col= "red")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col = c("black","red","blue"))
  
  plot(dmy_hms(paste(consumption_two_dates$Date,consumption_two_dates$Time)),consumption_two_dates$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.off()
  
}