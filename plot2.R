dataFull <- read.csv("../household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataFull$Date <- as.Date(dataFull$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(dataFull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataFull)

##You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
