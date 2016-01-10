# Read in all the data and subset it to only the necessary two days in feburary and concatenate Date and Time into the Time column

all_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
feb_1_data <- subset(all_data, all_data$Date == "1/2/2007")
feb_2_data <- subset(all_data, all_data$Date == "2/2/2007")
feb_data <- rbind(feb_1_data, feb_2_data)
feb_data$Time <- paste(feb_data$Date, feb_data$Time)

# Changing the class of the sub meter data to a numeric vector so that it can be plotted

submeter_1 <- as.numeric(feb_data$Sub_metering_1)
submeter_2 <- as.numeric(feb_data$Sub_metering_2)
submeter_3 <- as.numeric(feb_data$Sub_metering_3)

# Create the plot and save it as plot3

png(filename = "plot3.png", width = 480, height = 480, bg= "transparent")

plot(strptime(feb_data$Time, format = "%d/%m/%Y %H:%M:%S"),submeter_1,type = "l", ylab = "Energy sub metering", xlab = " ")
lines(strptime(feb_data$Time, format = "%d/%m/%Y %H:%M:%S"),submeter_2, col = "red")
lines(strptime(feb_data$Time, format = "%d/%m/%Y %H:%M:%S"),submeter_3, col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black","red","blue"))

dev.off()