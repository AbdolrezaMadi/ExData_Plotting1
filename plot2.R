library(lubridate)

# find the first row based on difference between the first timestamp and assumption of 1 minute sampling rate

# load first line
data_test <- read.csv("Data/household_power_consumption.txt",sep = ";",na.strings = "?",nrows = 2)
first_row <- as.numeric(ymd("2007-02-01") - dmy(data_test$Date[1]))*1440 - as.numeric(strptime(data_test$Time[1],"%T") - strptime("00:00:00","%T"))*60

# load interesting data
data <- read.csv("Data/household_power_consumption.txt",header = FALSE,sep = ";",skip = first_row+1, nrows = 1440*2,na.strings = "?",stringsAsFactors = FALSE)
names(data) <- names(data_test)


x_axis <- dmy(data$Date) + hms(data$Time)
plot(x_axis,data$Global_active_power,ylab= ("Global Active Power (kilowatts)"),type = "l",xlab="")
dev.print(png, file = "plot2.png", width = 480, height = 480,units = "px")


