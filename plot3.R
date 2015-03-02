# Load the data set using a common helper script
source("plotCommon.R")

df <- get.dataset()

# Setup and open the PNG output device
png(filename = "plot3.png", width = 480, height = 480, units = "px")
Sys.setlocale("LC_TIME", "English")

# Create the three sub-plots
with(df, plot(DateTime, 
              Sub_metering_1, 
              type="l", 
              xlab="",
              ylab="Energy sub metering"))
with(df, lines(DateTime, Sub_metering_2, col="red"))
with(df, lines(DateTime, Sub_metering_3, col="blue"))

# Add legeng
legend("topright", 
       lty="solid",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the PNG output device
dev.off()