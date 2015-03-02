# Load the data set using a common helper script
source("plotCommon.R")

df <- get.dataset()

# Setup and open the PNG output device
png(filename = "plot2.png", width = 480, height = 480, units = "px")
Sys.setlocale("LC_TIME", "English")

# Create the plot
with(df, plot(DateTime, 
              Global_active_power, 
              type="l", 
              xlab="",
              ylab="Global Active Power (kilowatts)"))

# Close the PNG output device
dev.off()