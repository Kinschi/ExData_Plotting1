## Downloading the data

dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "household_power_consumption.zip")
unzip("household_power_consumption.zip", exdir="power_consumption")
list.files("power_consumption")

## Loading the data into R and subestting the data

File <- "./power_consumption/household_power_consumption.txt"
data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Creating png 1

globalActivePower <- as.numeric(data_subSet$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()