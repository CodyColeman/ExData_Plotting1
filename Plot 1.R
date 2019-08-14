
#Get the data and subset it to the first two days of February 2007.
dataDownload <- 'household_power_consumption.txt'
data <- read.table(dataDownload, sep = ';', skip = 1, stringsAsFactors = FALSE)
colnames(data) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 
                    'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
subdata <- subset(data, Date == c('1/2/2007', '2/2/2007'))

#Make the Plot
GlobalActivePower <- as.numeric(subdata$Global_active_power)
png('plot1.png', width = 480, height = 480)
hist(GlobalActivePower, main = 'Global Active Power', col = 'red', xlab = 'Global Active Power (kilowatts)')
dev.off()


