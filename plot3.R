powerdata <- read.table('household_power_consumption.txt', header = T, sep = ';', na.strings = '?',
                        colClasses = c('character', 'character', 'numeric', 'numeric',
                                       'numeric', 'numeric','numeric', 'numeric','numeric'))
subdata <- subset(powerdata, Date == '1/2/2007' | Date == '2/2/2007')
rm(powerdata)

subdata <- transform(subdata, Datetime = strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S')) 

with(subdata, plot(Datetime, Sub_metering_1, type = 'n', 
                   xlab = '', ylab = 'Energy sub metering'))
with(subdata, lines(Datetime, Sub_metering_1, col = 'black'))
with(subdata, lines(Datetime, Sub_metering_2, col = 'red'))
with(subdata, lines(Datetime, Sub_metering_3, col = 'blue'))
legend('topright', col = c('black','red','blue'), lty = 1,
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))


dev.copy(png, 'plot3.png', width = 480, height = 480)
dev.off()

