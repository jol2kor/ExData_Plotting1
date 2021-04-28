# R script to output Plot2.png a line graph for the variable Global active power 

# Include Lubridate library for date and time functions
  library(lubridate)

# Read the file and select only 2 days of data as per requirement

  x <- read.csv2("household_power_consumption.txt")

  data_2days <- subset(x, dmy(Date) == "2007-02-01" | dmy(Date) == "2007-02-02")
  
# Preparing the Date to be in the right format for the line plot
  dmy_date <- as.Date(dmy(data_2days$Date))
  date_time <- paste(dmy_date, data_2days$Time, sep = " ")
  date_time <- strptime(date_time, format="%Y-%m-%d %H:%M:%S")

# Preparing the data for graph

  y <- as.numeric(data_2days$Global_active_power)
  
# Creating png file and plotting it 
  
  png(filename = "plot2.png", width = 480, height = 480)
  plot( date_time, y, type = "l", lty = 1, xlab = "", ylab = " Global Active Power (kilowatts)")
  dev.off()


