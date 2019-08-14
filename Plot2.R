#Download and Subset.
dataDownload <- 'household_power_consumption.txt'
data <- read.table(dataDownload, sep = ';', skip = 1, stringsAsFactors = FALSE)
colnames(data) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 
                    'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
subdata <- subset(data, Date == c('1/2/2007', '2/2/2007'))

newTime <- strptime(paste(subdata$Date, subdata$Time, sep = ' '), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subdata$Global_active_power)
png('plot2.png', width = 480, height = 480)
with(subdata, plot(newTime, GlobalActivePower, type = 'l', xlab = 'Day', ylab = 'Global Active Power (kilowatts)'))
dev.off()