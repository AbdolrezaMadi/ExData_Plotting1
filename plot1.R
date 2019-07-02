library(lubridate)

# find the first row based on difference between the first timestamp and assumption of 1 minute sampling rate

# load first line
data_test <- read.csv("Data/household_power_consumption.txt",sep = ";",na.strings = "?",nrows = 2)
first_row <- as.numeric(ymd("2007-02-01") - dmy(data_test$Date[1]))*1440 - as.numeric(strptime(data_test$Time[1],"%T") - strptime("00:00:00","%T"))*60

# load interesting data
data <- read.csv("Data/household_power_consumption.txt",header = FALSE,sep = ";",skip = first_row+1, nrows = 1440*2,na.strings = "?",stringsAsFactors = FALSE)
names(data) <- names(data_test)



hist(data$Global_active_power,col="red",main="Global Active Power",xlab= ("Global Active Power (kilowatts)"))
dev.print(png, file = "plot1.png", width = 480, height = 480,units = "px")


