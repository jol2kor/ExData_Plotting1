# R script to output Plot4.png a multiple line graph with legends 
# for the 3 submeter readings

# Include Lubridate library for date and time functions
  library(lubridate)

# Read the file and select only 2 days of data as per requirement

  x <- read.csv2("household_power_consumption.txt")

  data_2days <- subset(x, dmy(Date) == "2007-02-01" | dmy(Date) == "2007-02-02")
  
# Preparing the Date to be in the right format for the line plot
  dmy_date <- as.Date(dmy(data_2days$Date))
  date_time <- paste(dmy_date, data_2days$Time, sep = " ")
  date_time <- strptime(date_time, format="%Y-%m-%d %H:%M:%S")
  

# Creating png file and plotting it
# multiple plots on the same graph is done by calling plot for the first time and calling lines for the subsequent plotting
  
  png(filename = "plot4.png", width = 480, height = 480)
  
# Setting up the panel of 2*2 plots with size reduction of text size
  par(mfrow = c(2, 2), cex = 0.75)
  
# First plot Active Power
  plot( date_time, as.numeric(data_2days$Global_active_power), type = "l", lty = 1, xlab = "", ylab = " Global active power ")
  
# Second plot on Voltage
  plot( date_time, as.numeric(data_2days$Voltage), type = "l", lty = 1, xlab = " datetime ", ylab = " Voltage ")
  
# Third plot is the sub meter multiple plot  
  
  plot( date_time, as.numeric(data_2days$Sub_metering_1), type = "l", lty = 1, xlab = "", ylab = " Energy sub metering ")  
  lines( date_time, as.numeric(data_2days$Sub_metering_2), type = "l", col = "red", lty = 1, xlab = "", ylab = " Global Active Power (kilowatts)")
  lines( date_time, as.numeric(data_2days$Sub_metering_3), type = "l", col = "blue", lty = 1, xlab = "", ylab = " Global Active Power (kilowatts)")
  legend("topright",lty=c(1,1,1),col=c("black","red", "blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.5)

# Fourth plot on Reactive Power
  plot( date_time, as.numeric(data_2days$Global_reactive_power), type = "l", lty = 1, xlab = " datetime ", ylab = " Global reactive power ")
  

  dev.off()


