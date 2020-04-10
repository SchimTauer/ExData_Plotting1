#Peer_assignment week1 - Plot3

#unzip downloaded file
zipF <- paste("./exdata_data_household_power_consumption.zip")
unzip(zipF)

#load data and format date column
d <- read.table("household_power_consumption.txt", header = TRUE, sep =";")

#format Date column
library(lubridate)
d$Date <- dmy(d$Date)

#subset rows of interest
library(dplyr)
df <- filter(d, Date == "2007-02-01" | Date == "2007-02-02")

#combine date and time columns for x-axis
df$Date_Time <- ymd_hms(paste(df$Date, df$Time))


#transform Sub_metering columns to numeric values
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

#Export
png("plot3.png", height=480, width=480, units="px", bg = "transparent")

with(df, plot(Date_Time, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
#add different lines
lines(df$Date_Time, df$Sub_metering_1)
lines(df$Date_Time, df$Sub_metering_2, col = "red")
lines(df$Date_Time, df$Sub_metering_3, col = "blue")
#add legend with properties
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"), lty=1)

dev.off()


