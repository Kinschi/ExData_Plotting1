## Downloading the data

dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "household_power_consumption.zip")
unzip("household_power_consumption.zip", exdir="power_consumption")
list.files("power_consumption")

## Loading the data into R and subestting the data

File <- "./power_consumption/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Creating png 2

datetime <- strptime(paste(data_subSet$Date, data_subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data_subSet$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()