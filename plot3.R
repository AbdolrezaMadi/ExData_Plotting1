library(lubridate)

# find the first row based on difference between the first timestamp and assumption of 1 minute sampling rate

# load first line
data_test <- read.csv("Data/household_power_consumption.txt",sep = ";",na.strings = "?",nrows = 2)
first_row <- as.numeric(ymd("2007-02-01") - dmy(data_test$Date[1]))*1440 - as.numeric(strptime(data_test$Time[1],"%T") - strptime("00:00:00","%T"))*60

# load interesting data
data <- read.csv("Data/household_power_consumption.txt",header = FALSE,sep = ";",skip = first_row+1, nrows = 1440*2,na.strings = "?",stringsAsFactors = FALSE)
names(data) <- names(data_test)


x_axis <- dmy(data$Date) + hms(data$Time)
plot(x_axis,data$Sub_metering_1,type ="n",ylab = ("Energy sub metering"),xlab = "")
lines(x_axis,data$Sub_metering_1,type = "l")
lines(x_axis,data$Sub_metering_2,type = "l",col = "red")
lines(x_axis,data$Sub_metering_3,type = "l",col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty=1)

dev.print(png, file = "plot3.png", width = 480, height = 480,units = "px")


