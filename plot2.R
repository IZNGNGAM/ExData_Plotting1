powerdata <- read.table('household_power_consumption.txt', header = T, sep = ';', na.strings = '?',
                        colClasses = c('character', 'character', 'numeric', 'numeric',
                                       'numeric', 'numeric','numeric', 'numeric','numeric'))
subdata <- subset(powerdata, Date == '1/2/2007' | Date == '2/2/2007')
rm(powerdata)

subdata <- transform(subdata, Datetime = strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S')) 

with(subdata, plot(Datetime, Global_active_power, type = 'n', 
                   xlab = '', ylab = 'Global Active Power (kilowatts)'))
with(subdata, lines(Datetime, Global_active_power))

dev.copy(png, 'plot2.png', width = 480, height = 480)
dev.off()

