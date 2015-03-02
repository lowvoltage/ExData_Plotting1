# Load the data set using a common helper script
source("plotCommon.R")

df <- get.dataset()

# Setup and open the PNG output device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
Sys.setlocale("LC_TIME", "English")

# Create the plot
hist(df$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# Close the PNG output device
dev.off()