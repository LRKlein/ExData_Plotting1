# Read in all the data and subset it to only the necessary two days in feburary and concatenate Date and Time into the Time column

all_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
feb_1_data <- subset(all_data, all_data$Date == "1/2/2007")
feb_2_data <- subset(all_data, all_data$Date == "2/2/2007")
feb_data <- rbind(feb_1_data, feb_2_data)
feb_data$Time <- paste(feb_data$Date, feb_data$Time)

# Creating the plot of Global Active Power and save it as plot2

feb_data_global_power <- as.numeric(feb_data$Global_active_power)

par("bg" = "transparent")
plot(strptime(feb_data$Time, format = "%d/%m/%Y %H:%M:%S"),feb_data_global_power, type= "l", ylab = "Global Active Power (kilowatts)", xlab = " ")

dev.copy(png,"plot2.png")
dev.off()

