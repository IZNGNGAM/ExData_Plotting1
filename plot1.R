powerdata <- read.table('household_power_consumption.txt', header = T, sep = ';', na.strings = '?',
                        colClasses = c('character', 'character', 'numeric', 'numeric',
                                       'numeric', 'numeric','numeric', 'numeric','numeric'))
subdata <- subset(powerdata, Date == '1/2/2007' | Date == '2/2/2007')
rm(powerdata)


hist(subdata$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

dev.copy(png, 'plot1.png', width = 480, height = 480)
dev.off()
