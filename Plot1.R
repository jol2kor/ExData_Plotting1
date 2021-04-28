# R script to output Plot1.png an histogram for the variable Global active power 

# Include Lubridate library for date and time functions
  library(lubridate)

# Read the file and select only 2 days of data as per requirement

  x <- read.csv2("household_power_consumption.txt")

  data_2days <- subset(x, dmy(Date) == "2007-02-01" | dmy(Date) == "2007-02-02")


# Draw the histogram first on screen
# With color Red and XLabel as "Global Active Power (kilowatts)"
# Title is "Global Active Power"

  y <- as.numeric(data_2days$Global_active_power)
  
# Creating png file and plotting it 
  
  png(filename = "plot1.png", width = 480, height = 480)
  hist(y, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()


