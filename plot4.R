# Read in all the data and subset it to only the necessary two days in feburary and concatenate Date and Time into the Time column

all_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
feb_1_data <- subset(all_data, all_data$Date == "1/2/2007")
feb_2_data <- subset(all_data, all_data$Date == "2/2/2007")
feb_data <- rbind(feb_1_data, feb_2_data)
feb_data$Time <- paste(feb_data$Date, feb_data$Time)

# Changing the classes of the feburary data to numeric vector so they can be plotted

feb_data_global_power <- as.numeric(feb_data$Global_active_power)
feb_data_voltage <- as.numeric(feb_data$Voltage)
submeter_1 <- as.numeric(feb_data$Sub_metering_1)
submeter_2 <- as.numeric(feb_data$Sub_metering_2)
submeter_3 <- as.numeric(feb_data$Sub_metering_3)
feb_data_global_reactive_power <- as.numeric(feb_data$Global_reactive_power)

# Creating 4 different plots stored in one PNG file called plot4

png(filename = "plot4.png", width = 480, height = 480, bg= "transparent")
par(mfrow=c(2,2))

plot(strptime(feb_data$Time, format = "%d/%m/%Y %H:%M:%S"),feb_data_global_power, type= "l", ylab = "Global Active Power (kilowatts)", xlab = " ")

plot(strptime(feb_data$Time, format = "%d/%m/%Y %H:%M:%S"), feb_data_voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(strptime(feb_data$Time, format = "%d/%m/%Y %H:%M:%S"),submeter_1,type = "l", ylab = "Energy sub metering", xlab = " ")
lines(strptime(feb_data$Time, format = "%d/%m/%Y %H:%M:%S"),submeter_2, col = "red")
lines(strptime(feb_data$Time, format = "%d/%m/%Y %H:%M:%S"),submeter_3, col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n", col = c("black","red","blue"))

plot(strptime(feb_data$Time, format = "%d/%m/%Y %H:%M:%S"), feb_data_global_reactive_power, type = "l", ylab= "Global_reactive_power", xlab = "datetime")

dev.off()