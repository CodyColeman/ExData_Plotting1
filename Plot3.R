#Download and Subset.
dataDownload <- 'household_power_consumption.txt'
data <- read.table(dataDownload, sep = ';', skip = 1, stringsAsFactors = FALSE)
colnames(data) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 
                    'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
subdata <- subset(data, Date == c('1/2/2007', '2/2/2007'))


newTime <- strptime(paste(subdata$Date, subdata$Time, sep = ' '), "%d/%m/%Y %H:%M:%S")
subdata <- cbind(newTime, subdata)

Submetering1 <- as.numeric(subdata$Sub_metering_1)
Submetering2 <- as.numeric(subdata$Sub_metering_2)
Submetering3 <- as.numeric(subdata$Sub_metering_3)

png('plot3.png', width = 480, height = 480)
with(subdata, plot(newTime, Submetering1, type = 'l', col = 'black', xlab = 'Day', ylab = 'Energy Sub Metering'))
lines(subdata$newTime, Submetering2, type = 'l', col = 'red')
lines(subdata$newTime, Submetering3, type = 'l', col = 'blue')
legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'),
        lty = 1, lwd = 2)
dev.off()