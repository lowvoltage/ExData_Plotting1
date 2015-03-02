# Load the data set using a common helper script
source("plotCommon.R")

df <- get.dataset()

# Setup and open the PNG output device
png(filename = "plot4.png", width = 480, height = 480, units = "px")
Sys.setlocale("LC_TIME", "English")

# Create the 2x2 canvas with default margins
par(mfrow=c(2, 2))

# Top-Left plot
with(df, plot(DateTime, 
              Global_active_power, 
              type="l", 
              xlab="",
              ylab="Global Active Power"))

# Top-Right plot
with(df, plot(DateTime, 
              Voltage, 
              type="l", 
              xlab="datetime",
              ylab="Voltage"))

# Bottom-Left plot
with(df, plot(DateTime, 
              Sub_metering_1, 
              type="l", 
              xlab="",
              ylab="Energy sub metering"))
with(df, lines(DateTime, Sub_metering_2, col="red"))
with(df, lines(DateTime, Sub_metering_3, col="blue"))

legend("topright", 
       bty="n",
       lty="solid",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom-Right plot
with(df, plot(DateTime, 
              Global_reactive_power, 
              type="l", 
              xlab="datetime"))

# Close the PNG output device
dev.off()