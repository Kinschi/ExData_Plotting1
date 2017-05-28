## Downloading the data

dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "household_power_consumption.zip")
unzip("household_power_consumption.zip", exdir="power_consumption")
list.files("power_consumption")

## Loading the data into R and subestting the data

File <- "./power_consumption/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Creating png 3

datetime <- strptime(paste(data_subSet$Date, data_subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data_subSet$Global_active_power)
subMetering1 <- as.numeric(data_subSet$Sub_metering_1)
subMetering2 <- as.numeric(data_subSet$Sub_metering_2)
subMetering3 <- as.numeric(data_subSet$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()