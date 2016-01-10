# Read in all the data and subset it to only the necessary two days in feburary

all_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
feb_1_data <- subset(all_data, all_data$Date == "1/2/2007")
feb_2_data <- subset(all_data, all_data$Date == "2/2/2007")
feb_data <- rbind(feb_1_data, feb_2_data)

# Creating the histogram of Global Active Power and save it as plot1

par("bg" = "transparent")
feb_data_global_power <- as.numeric(feb_data$Global_active_power)
hist(feb_data_global_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png,"plot1.png")
dev.off()
